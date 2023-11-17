Class {
	#name : #ASN1ModuleDefinitionNode,
	#superclass : #ASN1ScopeNode,
	#instVars : [
		'identifier',
		'encodingReferenceDefault',
		'tagDefault',
		'extensionDefault',
		'exports',
		'imports',
		'assignments',
		'encodingControlSections'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ModuleDefinitionNode >> accept: aVisitor [ 
	^ aVisitor visitModuleDefinitionNode: self
]

{ #category : #adding }
ASN1ModuleDefinitionNode >> addAsModuleTo: anASTRoot [ 
	anASTRoot addModule: self 
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> assignments [
	^ assignments ifNil: [
		assignments := OrderedCollection new ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> assignments: anObject [
	assignments := anObject
]

{ #category : #binding }
ASN1ModuleDefinitionNode >> bindingOf: aString [
	[ ^ self resolveName: aString ]
	on: Error
	do: [:err| ^ nil ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> encodingControlSections [
	^ encodingControlSections
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> encodingControlSections: anObject [
	encodingControlSections := anObject
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> encodingReferenceDefault [
	^ encodingReferenceDefault ifNil: [
		encodingReferenceDefault := ASN1TagEncodingReference new ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> encodingReferenceDefault: anObject [
	encodingReferenceDefault := anObject
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> exports [
	^ exports ifNil: [
		exports := OrderedCollection new ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> exports: anObject [
	exports := anObject
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> extensionDefault [
	^ extensionDefault
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> extensionDefault: anObject [
	extensionDefault := anObject
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> identifier [
	^ identifier
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> importIdentifiers [
	^ self imports collect: #moduleIdentifier
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> imports [
	^ imports ifNil: [
		imports := OrderedCollection new ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> imports: anObject [
	imports := anObject
]

{ #category : #testing }
ASN1ModuleDefinitionNode >> isAsn1ModuleDefinitionNode [
	^ true
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> localNames [
	^ (self assignments 
		collect: [:each| 
			each left label -> each right]) asDictionary 

]

{ #category : #private }
ASN1ModuleDefinitionNode >> matches: aModuleIdentifier [
	^ self identifier = aModuleIdentifier
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> moduleName [
	^ self identifier name
]

{ #category : #printing }
ASN1ModuleDefinitionNode >> printOn: aStream [
	"identifier encodingReferenceDefault tagDefault extensionDefault exports imports assignments encodingControlSections"
	identifier printOn: aStream.
"	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[exports] '.
	exports printOn: aStream.
	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[imports] '.
	imports printOn: aStream.
	aStream nextPut: Character cr.
	
	aStream nextPutAll: '[assignments] '.
	assignments ifNotNil: [
		assignments do: [:each|
			each printOn: aStream
			] separatedBy: [ aStream nextPut: Character cr].
		aStream nextPut: Character cr ]."
]

{ #category : #testing }
ASN1ModuleDefinitionNode >> providesScope [ 
	^ true
]

{ #category : #'as yet unclassified' }
ASN1ModuleDefinitionNode >> resolveImportedName: aString [
	self imports do: [:import|
		import symbols do: [:symbol|
			(symbol label = aString) ifTrue: [
				^ symbol propertyAt: #definition ]]].
	^ nil
]

{ #category : #'as yet unclassified' }
ASN1ModuleDefinitionNode >> resolveLocalName: aString [
	^ self localNames 
		at: aString
		ifAbsent: [ nil ]

]

{ #category : #'as yet unclassified' }
ASN1ModuleDefinitionNode >> resolveName: aString [
	^ (self resolveLocalName: aString) ifNil: [
		(self resolveImportedName: aString)
			ifNotNil: [:val| ^ val ]
			ifNil: [ Error signal: 'could not resolve name ', aString ]]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> tagDefault [
	^ tagDefault ifNil: [
		tagDefault := ASN1ExplicitTags  ]
]

{ #category : #accessing }
ASN1ModuleDefinitionNode >> tagDefault: anObject [
	tagDefault := anObject
]
