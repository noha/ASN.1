Class {
	#name : #ASN1ASTRoot,
	#superclass : #Object,
	#instVars : [
		'modules'
	],
	#category : 'ASN1-AST'
}

{ #category : #visiting }
ASN1ASTRoot >> accept: aVisitor [
	^ aVisitor visitRoot: self
]

{ #category : #actions }
ASN1ASTRoot >> addImportedModules [
	"load modules that are imported by existing modules recursively"
	| list seen |
	list := LinkedList withAll: self modules.
	seen := OrderedCollection new.
	[ list notEmpty ] whileTrue: [ |module|
		module := list removeFirst. 
		(seen includes: module) ifFalse:[
			seen add: module.
			module importIdentifiers do: [:identifier|
				list addLast: (self moduleWithIdentifier: identifier) ]]]
]

{ #category : #accessing }
ASN1ASTRoot >> addModule: aModule [
	^ self modules add: aModule
]

{ #category : #actions }
ASN1ASTRoot >> addModuleFrom: aString [
	"add module from a text source. Prevent modules being added if parsing has gone
	wrong"
	^ self addModule: (self parseModuleFrom: aString)

]

{ #category : #actions }
ASN1ASTRoot >> annotateAsts [
	self
		resolveImportSymbols;
		resolveAllSymbols;
		resolveAmbiguities;
		resolveAllSymbols;
		resolveRelativeOids;
		resolveInconsistencies;
		resolveAllSymbols;
		detectPDUs
]

{ #category : #accessing }
ASN1ASTRoot >> bindingNamed: aString [
	self modules do: [:module|
		module assignments associationsDo: [:assignment|
			(assignment left label = aString ) ifTrue: [
				^ assignment ]]].
	^ nil
]

{ #category : #binding }
ASN1ASTRoot >> bindingOf: aString [
	^ self resolveName: aString
]

{ #category : #resolving }
ASN1ASTRoot >> defaultModule [
	^ self modules 
		detect: [ :each | each moduleName = 'default' ]
		ifNone: [  ^ nil ]
]

{ #category : #actions }
ASN1ASTRoot >> detectPDUs [ 
	"annotate a module with the definition of a PDU"
	self modules allButFirst do: [:each| | a |
		a := self pduForModule: each. ]
]

{ #category : #testing }
ASN1ASTRoot >> includesModuleNamed: aModuleName [
	^ (self moduleIdentifierNamed: aModuleName) notNil
]

{ #category : #resolving }
ASN1ASTRoot >> inquireModuleWithIdentifier: aModuleIdentifier [
	"raise resumable exception to inquire a module or module source string"
	^ (ASN1MissingModule new identifier: aModuleIdentifier; signal)
		ifNotNil: [ :moduleOrSource |
			 moduleOrSource isAsn1ModuleDefinitionNode 
				ifTrue: [ self addModule: moduleOrSource ]
				ifFalse: [ self addModuleFrom: moduleOrSource  ]]
		ifNil: [ Error signal: 'cannot resolve module with identifier ', aModuleIdentifier asString ]
]

{ #category : #resolving }
ASN1ASTRoot >> moduleIdentifierNamed: aModuleName [
	^ (self modules
		detect: [:each| each identifier name = aModuleName ]
		ifNone: [ ^ nil ]) identifier
]

{ #category : #resolving }
ASN1ASTRoot >> moduleWithIdentifier: aModuleIdentifier [
	"resolve a module by its identifier. If the identifier cannot be found resolve the module
	with its name. If no module is found throw a resumable exception so someelse can provide
	a module"
	^ self modules 
		detect: [:each| each identifier = aModuleIdentifier ]
		ifNone: [ 
			(self moduleWithName: aModuleIdentifier name label) 
				ifNotNil: [:module|
					Transcript 
						show: 'WARNING: did not find module by OID ', aModuleIdentifier oid printString, 
								' only by name ', aModuleIdentifier name printString; 
						cr.
					module]
				ifNil: [ self inquireModuleWithIdentifier: aModuleIdentifier  ]]
]

{ #category : #resolving }
ASN1ASTRoot >> moduleWithName: aModuleName [
	^ self modules 
		detect: [:each| each identifier name = aModuleName ]
		ifNone: [ nil ]
]

{ #category : #accessing }
ASN1ASTRoot >> modules [
	^ modules ifNil: [
		modules := OrderedCollection new ] 
]

{ #category : #accessing }
ASN1ASTRoot >> modules: aCollection [
	modules := aCollection

]

{ #category : #'as yet unclassified' }
ASN1ASTRoot >> optimizeModuleOrder [
	modules := modules copy sort: [ :a :b |
		a imports anySatisfy: [:import| import moduleIdentifier name label= b identifier name ] ] 
]

{ #category : #actions }
ASN1ASTRoot >> parseModuleFrom: aString [
	| module |
	module := ASN1ASTParser parse: aString.
	module isPetitFailure
		ifTrue: [ Error signal: 'failed to parse module from string: ', aString asString ].
	^ module
]

{ #category : #resolving }
ASN1ASTRoot >> pduForModule: aModule [
	| visitor  pdu |
	visitor := ASN1PDUFindingVisitor new.
	visitor visit: aModule.
	(visitor candidates size = 1)
		ifTrue: [ pdu := visitor candidates associations first ].
	(visitor candidates size > 1)
		ifTrue: [ 
			(visitor candidates associations select: [:each| (each value label indexOfSubCollection: 'PDU') > 0])
				ifNotEmpty: [:pdus|
					(pdus size = 1) 
						ifTrue: [ pdu := pdus first ]
						ifFalse: [ Error signal: 'could not determine pdu spec, ',pdus size asString, ' alternatives left']]].
	pdu isNil ifTrue: [ ^ nil ].
	(aModule assignments detect: [:each| each left = pdu value ])
		propertyAt: #PDU put: true
	
]

{ #category : #resolving }
ASN1ASTRoot >> resolveAllSymbols [
	"annotate all names in the grammar with their definition"	
	self accept: (ASN1SymbolResolvingVisitor new root: self)
]

{ #category : #resolving }
ASN1ASTRoot >> resolveAmbiguities [
	"rewrite ambiguous nodes to real nodes using  their context"
	| visitor newRoot |
	visitor := ASN1AmbiguitySolvingVisitor  new root: self.
	newRoot := self accept: visitor
]

{ #category : #resolving }
ASN1ASTRoot >> resolveImportSymbols [
	"annotate all imported modules and names with their definitions"
	self accept: (ASN1ImportSymbolVisitor new root: self)
]

{ #category : #resolving }
ASN1ASTRoot >> resolveInconsistencies [
	"check the AST finally for incosistencies before we convert it to the model"
	self accept: (ASN1InconsistencySolvingVisitor new)
]

{ #category : #resolving }
ASN1ASTRoot >> resolveName: aString [
	self defaultModule localNames 
		at: aString
		ifPresent: [:val| ^ val ].
	Transcript show: 'WARNING: resolving name ',aString printString ,' globally ';cr.
	self modules do: [:module|
		module localNames
			at: aString
			ifPresent: [:val| ^ val ]].
	Error signal: 'couldn''t resolve name ', aString printString, String cr
]

{ #category : #resolving }
ASN1ASTRoot >> resolveRelativeOids [
	"resolve OIDs defined by reference"
	self accept: (ASN1RelativeOidResolvingVisitor new)
]
