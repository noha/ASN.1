Class {
	#name : #ASN1SymbolResolvingVisitor,
	#superclass : #ASN1EnvironmentVisitor,
	#instVars : [
		'module'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #resolving }
ASN1SymbolResolvingVisitor >> resolveLabel: aString [
	^ self scope lookup: aString
]

{ #category : #resolving }
ASN1SymbolResolvingVisitor >> resolveReference: aReference [
	(aReference isUnresolved) ifTrue: [ | def |
 		def := self resolveLabel: aReference label.
		def propertyAt: #referenced put: true.
		aReference definition: def ]
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visit: anObject [

	super visit: anObject.
	"In order to be able to associate definitions to their modules
	we tag every object with its module. Only references can be in 
	separate modules so we don't treat them. The defintion of a
	reference will be treated in their respective module anyway"
	(anObject notNil & anObject isAsn1ReferenceNode not) ifTrue: [
			anObject propertyAt: #module put: module ]
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitAmbiguousNode: anAmbiguousNode [
	^ anAmbiguousNode
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitAssignmentNode: aNode [
	aNode right beAssigned.
	^ (super visitAssignmentNode: aNode)
			
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitBitStringValueNode: aNode [
	super visitBitStringValueNode: aNode.
	"resolve the values for the named bits"
	aNode setBitValues: (aNode value collect: [:each| self resolveLabel: each])
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitBooleanValueNode: aBooleanValueNode [ 
	^ aBooleanValueNode 
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode [ 
	"parse defined syntax and build map from field references to values. Resolve field 
	type references and value references like any other object.
	Field types are pushed to the scope chains because value references can refer to
	named types within a field type"
	| dict |
	dict := aDefinedSyntaxObjectNode parseSyntax.
	dict associations collect: [ :assoc | | field |
		field := (aDefinedSyntaxObjectNode type definition bindingOf: assoc key) definition.
		"grammar that resolves to a reference is likely not resolved to its definition. 
		We try this manually to bridge the gap here"
		field type ifNotNil: [  
			field type definition ifNil: [ 
				field type definition: (self resolveLabel: field type label) ].
			self 
				pushScope: field type definition 
				during: [  self visit: assoc value ] ] ]. 
	^  aDefinedSyntaxObjectNode  
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitModuleDefinitionNode: aModuleDefinition [
	| previousModule |
	previousModule := module.
	module := aModuleDefinition.
	^ [ super visitModuleDefinitionNode: aModuleDefinition  ]
		ensure: [ module := previousModule  ]
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitParameterNode: aNode [
	super visitParameterNode: aNode.
	aNode reference definition: aNode type
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitReferenceNode: aReferenceNode [
	super visitReferenceNode: aReferenceNode.
	self resolveReference: aReferenceNode
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitSequenceValueNode: aNode [ 
	"Resolve each named value in the nodes' elements to a sequence type slot
	value. Each named values 'name' refers to a slot in the sequence type. The
	named values 'value' refers to a value defined by that slot being found"
	aNode resolvedValue: (
		aNode elements collect: [ :namedValue |
			namedValue name -> 
				((self resolveLabel: namedValue name)
					 type bindingOf: namedValue value label) ] ) 
]

{ #category : #visiting }
ASN1SymbolResolvingVisitor >> visitTypeFieldNode: aNode [
	| type |
	type := aNode type.
	self resolveReference: type.
	aNode fields do: [:field|
		type := type definition typeOf: field label.
		type isAsn1ReferenceNode ifTrue: [
			self resolveReference: type  ]].

]
