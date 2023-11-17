Class {
	#name : #ASN1ModelBuilderVisitor,
	#superclass : #ASN1RewriteVisitor,
	#instVars : [
		'module',
		'objects',
		'hits'
	],
	#category : 'ASN1-Builder'
}

{ #category : #'initialize-release' }
ASN1ModelBuilderVisitor >> initialize [ 
	super initialize.
	objects := IdentityDictionary new.
	hits := IdentityDictionary new.
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> useModule: aModule during: aBlock [
	| previousModule |
	previousModule := module.
	module := aModule.
	[ ^ aBlock value ]
		ensure: [ module := previousModule ]
	
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visit: aNode [
	| object |
	aNode isNil ifTrue: [ ^ nil ].
	"do not convert objects multiple times. If it is the same input object we return the cached 
	version that has been generated earlier"
	objects at: aNode ifPresent: [:obj| ^ obj ].
	object := super visit: aNode.
	"while visiting aNode it could be already defined by a recursive redefinition. In that case
	throw away the return type and use the cached object in order to only have identical objects"
	objects at: aNode ifPresent: [ :o|  ^ o  ].
	aNode isAssigned ifTrue: [
		objects at: aNode put:  object ].
	^ object

]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitAmbiguousNode: aNode [
	self inform: 'there shouldnt be any ambiguous nodes at this stage'.
	^ self visitNode: aNode
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitAnyTypeNode: aNode [
	^ ASN1AnyType new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitAssignmentNode: anAssignment [
	| right |
	right := (self visit: anAssignment right).
	^ anAssignment left label -> right
		
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitBinaryBitStringValueNode: aBitStringValueNode [ 

	^ ASN1BinaryBitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		contents: aBitStringValueNode value;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitBitStringNode: aBitString [ 
	^ ASN1BitStringType new
		namedBits: (self visitAll: aBitString bits);
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitBitStringValueNode: aBitStringValueNode [ 
	^ ASN1BitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		contents: aBitStringValueNode value;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitChoiceNode: aNode [
	"If a choice has a choice as element all elements if the child choice are copied into this instance. This resolves context 
	specific tagged elements to the location where they are resolved from an encoding"
	| elements |
	elements := (self visitAll: aNode elements).
	elements := elements
		inject: SmallDictionary new
		into: [:col :elem| 
		(elem value class = ASN1ChoiceType) 
			ifTrue: [ col addAll: elem value elements ]
			ifFalse: [ col add: elem ].
			col ].
	^ ASN1ChoiceType new
		elements: elements;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitChoiceValueNode: aChoiceValueNode [ 
	^ ASN1ChoiceValue new
		type: aChoiceValueNode choice;
		value: aChoiceValueNode value;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitComponentTypeNode: aComponentTypeNode [
	"assign the type of the node to its default value if there is any. Convert
	the component type to a association holding key and value of the 
	component type"
	| type |
	(aComponentTypeNode modifiers notNil and: [ aComponentTypeNode modifiers isDefaultValue ]) ifTrue: [ 
		aComponentTypeNode modifiers type: aComponentTypeNode basicType ].
	type := (self visit: aComponentTypeNode type). 
	^ Association new
		key: type key;
		value: (ASN1ComponentType new
			module: module;
			type: type value;
			modifier:  (self visit: aComponentTypeNode modifiers);
			yourself)
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitComponentsOfNode: aComponentsOf [ 
	Error signal: 'this method should not be called. '
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitConstraintNode: aNode [
	^ ASN1Constraint new
		constraint: (self visit: aNode constraint );
		exception: (self visit: aNode exception)
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitDefaultSyntaxClassNode: aNode [ 
	^ ASN1ClassType new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitDefinedSyntaxClassNode: aNode [
	"classes should not be needed beyond this point. Classes just help
	instantiating objects"
	"returning dummy class for debugging purpose"
	^ ASN1ClassType new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitDefinedSyntaxObjectNode: aNode [
	|  dict |
	dict := aNode parseSyntax.
	dict associations do: [:assoc| | val |
		assoc value dereferenced isTypeNode
			ifTrue: [ val := assoc value ]
			ifFalse: [
				val := aNode type dereferenced
					instantiateFieldAt: assoc key value: assoc value dereferenced].
		assoc value: (self visit: val)
		].
	^ ASN1ObjectType new
		clazz: aNode type label;
		module: module;
		initializeFromDict: dict
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitElementsNode: aNode [
	^ ASN1ElementComplement new
		included: (self visit: aNode entity);
		excluded: (self visitAll: aNode exclusions)
		
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitEnumeratedNode: aNode [
	^ ASN1EnumeratedType new
		elements: (self visitAll: aNode elements);
		module: module;
		sanitizeValues
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitExtensionAndExceptionNode: anExtensionNode [ 
	"ignoring the exception for now"
	self flag: #needsRedesign.
	^ ASN1Extension new
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitExtensionNode: anExtensionNode [ 
	^ ASN1Extension new
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitExternalNode: aNode [
	^ ASN1ExternalType new 
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitHexBitStringValueNode: aBitStringValueNode [ 

	^ ASN1HexBitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		contents: aBitStringValueNode value;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitIntegerNode: aNode [
 	^ ASN1IntegerType new
		namedNumbers: (self visitAll: aNode namedNumbers);
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitIntegerValueNode: aIntegerValueNode [ 

	^ ASN1IntegerValue new
		type: ASN1IntegerType new;
		contents: aIntegerValueNode value
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitIntersectionNode: aNode [
	
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitLiteralNode: aNode [
	^ aNode string
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitModifierDefaultValueNode: aNode [ 
	^ ASN1ModifierDefaultValue  new 
		value: (self visit: aNode value)
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitModifierOptionalNode: aNode [ 
	^ ASN1ModifierOptional new
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitModuleDefinitionNode: aModuleDefinition [ 
	| m |
	m := ASN1Module new
		name: aModuleDefinition identifier name.
	objects at: aModuleDefinition put: m.
	self
		useModule: m
		during:[	
			module addFields: (self visitAll: aModuleDefinition assignments) asDictionary.
			aModuleDefinition identifier ifNotNil: [
				module oid: aModuleDefinition identifier oid oidString asAsn1Oid ].
			(aModuleDefinition assignments 
				detect: [:each| each hasProperty: #PDU ]
				ifNone: [nil])
					ifNotNil: [:assignment| module pduLabel: assignment left label ].
			module tagEnvironment: aModuleDefinition tagDefault.
			^ module ]	
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitNamedBitNode: aNamedBitNode [ 
	^ ASN1NamedValue new
		name: aNamedBitNode name;
		value: aNamedBitNode value asNumber;
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitNamedNumberNode: aNode [
	^ ASN1NamedNumber new
		name: aNode name;
		number: aNode number
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitNamedTypeNode: aNode [
	| assoc |
	assoc := Association new
		key: aNode name;
		value: (self visit: aNode type ).
	^ assoc
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitNullTypeNode: aNode [
	^ ASN1NullType new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitObjectIdentifierNode: anObjectId [
	^ (ASN1ObjectIdentifier contents: anObjectId oidString)
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitObjectIdentifierTypeNode: aNode [
	^ ASN1ObjectIdentifierType new 
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitObjectSetNode: anObjectSetNode [
	^ ASN1SetType new
		elements: (self visit: anObjectSetNode elementsSpec);
		module: module

]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitOpenTypeNode: aNode [
	^ ASN1OpenType new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitPrimitiveNode: aNode [
	"resolve the name of the node to a implementation class
	of the primitive"
	^ (ASN1PrimitiveType withUniversalType: aNode name) new
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitPrimitiveValueNode: aPrimitiveValueNode [ 
	Error signal: 'this method should never be called'
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitReferenceNode: aReferenceNode [

	^ aReferenceNode isDeclaration 
		ifTrue: [ super visitReferenceNode: aReferenceNode ]
		ifFalse: [ 
			self 
				useModule: (self visit: (aReferenceNode definition propertyAt: #module)) 
				during: [ self visit: aReferenceNode definition ] ]
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitRoot: aRoot [
	"the default module containing the implicit classes object identifier and abstract
	syntax is always on first place so we take the second module which is the first
	the has been explicitly loaded"
	^ self visitAll: (aRoot modules reject: [ :each | each identifier name = 'default' ])
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitSelectionTypeNode: aNode [
	"a selection type selects one slot of a collection type. We need to resolve the type first
	and then find the the element with corresponding name"
	|  element |
	element := (self visit: aNode type) elements at: aNode name
		"detect: [:each| each key = aNode name]".
	^ element value
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitSequenceNode: aNode [
	| node |
	node := aNode normalized.
	^ ASN1SequenceType new
		module: module;
		elements: ((self visitAll: node elements) ifNotNil: [ :col |
			col inject: SmallDictionary new into: [ :dict :elem |
				elem value isExtension 
					ifTrue: [ dict at: #extensionMarker put: elem; yourself ]
					ifFalse: [ dict at: elem key put: elem value; yourself ].
				dict ] ])
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitSequenceValueNode: aNode [
	^ ASN1SequenceValue new
		module: module;
		elements: (aNode resolvedValue collect: [:resolved|
			resolved key -> (self visit: resolved value) ])
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitSetNode: aNode [
	| node |
	node := aNode normalized.
	^ ASN1SetType new
		elements: (self visitAll: node elements);
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTagNode: aTag [
	^ ASN1Tag new
		clazz: aTag tagClass;
		number: aTag tagNumber asInteger
	
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTaggedTypeNode: aNode [
	^ ASN1TaggedType new
		module: module;
		type: (self visit: aNode type);
		tag: (self visit: aNode tag);
		tagEnvironment: aNode tagEnvironment
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTypeFieldNode: aNode [
	| result |
	result := aNode resolveType.
	[ result isAsn1ReferenceNode ] whileTrue: [
		result := result definition ].
	^ self visit: result 

]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTypeFromObjectNode: aTypeFromObject [ 
	| object |
	object := aTypeFromObject object dereferenced.
	^ self visit: (aTypeFromObject field inject: object into: [:obj :field| 
		object bindingOf: field label ]) type.

]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTypedSequenceNode: aNode [
	^ ASN1TypedSequenceType new
		type: (self visit: aNode type);
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitTypedSetNode: aNode [
	^ ASN1TypedSetType new
		type: (self visit: aNode type);
		module: module
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitUnionNode: aNode [
	^ ASN1Union new
		elements: (self visitAll: aNode elements )
]

{ #category : #visiting }
ASN1ModelBuilderVisitor >> visitValueSetNode: aNode [
	^ ASN1SetType new
		elements: (self visit: aNode elementsSpec );
		module: module
]
