Class {
	#name : #ASN1ASTVisitor,
	#superclass : #Object,
	#category : 'ASN1-AST-Visitor'
}

{ #category : #visiting }
ASN1ASTVisitor >> visit: anObject [
	anObject isNil ifTrue: [ ^ nil ].
	^ anObject accept: self
]

{ #category : #visiting }
ASN1ASTVisitor >> visitAll: aCollection [
	aCollection isNil ifTrue: [ ^ aCollection ].
	^ aCollection collect: [:each|
		self visit: each ]
]

{ #category : #visiting }
ASN1ASTVisitor >> visitAmbiguousNode: anAmbiguousNode [ 
	self visitAll: anAmbiguousNode alternatives.
	^ anAmbiguousNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitAnyTypeNode: anAnyNode [ 
	^ anAnyNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitAssignmentNode: anAssignmentNode [
	self visit: anAssignmentNode left.
	self visit: anAssignmentNode right.
	^ anAssignmentNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitBinaryBitStringValueNode: aBitStringValueNode [ 
	^ self visitValueNode: aBitStringValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitBitStringNode: aBitString [ 
	^ self visitPrimitiveNode: aBitString
]

{ #category : #visiting }
ASN1ASTVisitor >> visitBitStringValueNode: aBitStringValueNode [ 
	^ self visitValueNode: aBitStringValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitBooleanValueNode: aPrimitiveValueNode [ 
	^ self visitValueNode: aPrimitiveValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitChoiceNode: aChoice [
	^ self visitCollectionNode: aChoice
]

{ #category : #visiting }
ASN1ASTVisitor >> visitChoiceValueNode: aChoiceValueNode [ 
	^ self visitValueNode: aChoiceValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitCollectionNode: aCollection [
	self visitAll: aCollection elements.
	^ self visitTypeNode: aCollection
]

{ #category : #visiting }
ASN1ASTVisitor >> visitComponentTypeListNode: aComponentTypeList [ 
	self visitAll: aComponentTypeList components.
	self visitNode: aComponentTypeList.
	^ aComponentTypeList 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitComponentTypeNode: aComponentTypeNode [ 
	self visit: aComponentTypeNode type.
	self visit: aComponentTypeNode modifiers.
	^ aComponentTypeNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitComponentsOfNode: aComponentsOf [ 
	self visit: aComponentsOf type.
	^  aComponentsOf
]

{ #category : #visiting }
ASN1ASTVisitor >> visitConstraintNode: aConstraint [
	self visit: aConstraint constraint.
	self flag: #hack.
	self visit: aConstraint exception.
	^ aConstraint
]

{ #category : #visiting }
ASN1ASTVisitor >> visitCustomStringNode: aCustomString [ 
	^ aCustomString 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode [
	self visitAll: aDefaultSyntaxClassNode fields.
	^ aDefaultSyntaxClassNode 

]

{ #category : #visiting }
ASN1ASTVisitor >> visitDefinedSyntaxClassNode: aDefinedSyntaxClass [ 
	self visitAll: aDefinedSyntaxClass fields.
	"self visitAll: aDefinedSyntaxClass syntax."
	^ aDefinedSyntaxClass 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitElementsNode: anElements [ 
	self visit: anElements entity.
	anElements exclusions ifNotNil: [
		self visitAll: anElements exclusions ].
	^ anElements
]

{ #category : #visiting }
ASN1ASTVisitor >> visitEnumeratedNode: anEnumerated [ 
	^  anEnumerated 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitExtensionAndExceptionNode: aNode [ 
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitExtensionNode: aNode [ 
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitExternalNode: aNode [ 
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitFieldSpecNode: aFieldSpec [ 
	self visit: aFieldSpec type.
	self flag: #needsRedesign.
	^ aFieldSpec 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitHexBitStringValueNode: aBitStringValueNode [ 
	^ self visitValueNode: aBitStringValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitImportNode: anImport [
	self visit: anImport moduleIdentifier.
	self visitAll: anImport symbols.
	^ anImport
]

{ #category : #visiting }
ASN1ASTVisitor >> visitIntegerNode: anInteger [
	self visitAll: anInteger namedNumbers.
	self visitTypeNode: anInteger.
	^ anInteger
]

{ #category : #visiting }
ASN1ASTVisitor >> visitIntegerValueNode: aIntegerValueNode [ 
	^ aIntegerValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitLiteralNode: aNode [
	^ aNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitModifierDefaultValueNode: aNode [ 
	self visit: aNode value.
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitModifierOptionalNode: anOptionalNode [ 
	^ anOptionalNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitModuleDefinitionNode: aModuleDefinition [
	self flag: #incomplete.
	self visit: aModuleDefinition identifier.
	self visitAll: aModuleDefinition exports.
	self visitAll: aModuleDefinition imports.
	self visitAll: aModuleDefinition assignments.
	^ aModuleDefinition 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitModuleIdentifierNode: aModuleIdentifierNode [ 
	"self visit: aModuleIdentifierNode name."
	self visit: aModuleIdentifierNode oid.
	^ aModuleIdentifierNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitNamedNumberNode: aNamedNumberNode [ 
	^ ASN1NamedNumberNode new
		name: aNamedNumberNode name;
		number: aNamedNumberNode number
]

{ #category : #visiting }
ASN1ASTVisitor >> visitNamedTypeNode: aNamedType [ 
	self visit: aNamedType type.
	^ aNamedType 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitNamedValueNode: aNode [ 
	^ self visit: aNode value
]

{ #category : #visiting }
ASN1ASTVisitor >> visitNode: aNode [ 
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitNullTypeNode: aNullType [ 
	^ aNullType
]

{ #category : #visiting }
ASN1ASTVisitor >> visitObjectIdComponentNode: anObjectIdComponent [ 
	^ anObjectIdComponent 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitObjectIdNode: anObjectId [
	self visitAll: anObjectId components.
	^ anObjectId
]

{ #category : #visiting }
ASN1ASTVisitor >> visitObjectIdentifierNode: anObjectId [
	self visitAll: anObjectId components.
	^ anObjectId
]

{ #category : #visiting }
ASN1ASTVisitor >> visitObjectIdentifierTypeNode: anObjectIdentifier [
	^ anObjectIdentifier 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitObjectSetNode: anObjectSetNode [
	self visit: anObjectSetNode elementsSpec.
	^ anObjectSetNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitOctetStringNode: aOctetString [
	^ self visitPrimitiveNode: aOctetString 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitOpenTypeNode: anOpenTypeNode [ 
	^ anOpenTypeNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitParameterNode: aParameterNode [ 
	self visit: aParameterNode type.
	"self visit: aParameterNode reference."
	^ aParameterNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitPrimitiveNode: aPrimitiveNode [ 
	^ self visitTypeNode: aPrimitiveNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitPrimitiveValueNode: aPrimitiveValueNode [ 
	^ self visitValueNode: aPrimitiveValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitReferenceNode: aReferenceNode [
	aReferenceNode hasParameters ifTrue: [
		self visitAll: aReferenceNode parameters ].
	aReferenceNode type ifNotNil: [
		self visit: aReferenceNode type].
	^ aReferenceNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitRoot: aRoot [
	"process all modules. For each module a new visitor is
	created to avoid side effects or recursive effects"
	aRoot modules do: [ :module | | visitor |
		visitor := self class new root: aRoot.
		visitor visit: module ].
	^ aRoot
]

{ #category : #visiting }
ASN1ASTVisitor >> visitSelectionTypeNode: aSelectionTypeNode [ 
	self visit: aSelectionTypeNode type.
	^ aSelectionTypeNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitSequenceNode: aNode [
	^ self visitCollectionNode: aNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitSequenceValueNode: aNode [ 
	self visitAll: aNode elements.
	^ aNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitSetNode: aNode [
	^ self visitCollectionNode: aNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTagNode: aTag [
	^ aTag
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTaggedTypeNode: aTypeNode [ 
	self visit: aTypeNode type.
	self visit: aTypeNode tag.
	^ aTypeNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypeFieldNode: aTypeFieldNode [ 
	self visit: aTypeFieldNode type.
	self visitAll: aTypeFieldNode fields.
	^ aTypeFieldNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypeFromObjectNode: aTypeFromObject [ 
	self visit: aTypeFromObject object.
	^ aTypeFromObject 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypeNode: aTypeNode [
	^ self visitNode: aTypeNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypedCollectionNode: aNode [
	self visit: aNode type.
	^ self visitNode: aNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypedSequenceNode: aSequenceNode [
	^ self visitTypedCollectionNode: aSequenceNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitTypedSetNode: aSetNode [
	^ self visitTypedCollectionNode: aSetNode
]

{ #category : #visiting }
ASN1ASTVisitor >> visitUnionNode: aUnion [
	self visitAll: aUnion elements.
	^ aUnion
]

{ #category : #visiting }
ASN1ASTVisitor >> visitValueCollectionNode: aValueCollectionNode [ 
	^ self visitAll: aValueCollectionNode elements
]

{ #category : #visiting }
ASN1ASTVisitor >> visitValueFromObject: anASN1ValueFromObject [ 
	self shouldBeImplemented.
]

{ #category : #visiting }
ASN1ASTVisitor >> visitValueFromObjectNode: aValueFromObjectNode [
	self visit: aValueFromObjectNode object
]

{ #category : #visiting }
ASN1ASTVisitor >> visitValueNode: aValueNode [
	^ self visitNode: aValueNode 
]

{ #category : #visiting }
ASN1ASTVisitor >> visitValueSetNode: aValueSetNode [ 
	self visit: aValueSetNode elementsSpec.
	^ aValueSetNode
]
