Class {
	#name : #ASN1RewriteVisitor,
	#superclass : #ASN1ASTVisitor,
	#category : 'ASN1-AST-Visitor'
}

{ #category : #visiting }
ASN1RewriteVisitor >> provideType: aNode during: aBlock [
	^ ASN1ClosestTypeDefinition 
		use: aNode
		during: aBlock
]

{ #category : #visiting }
ASN1RewriteVisitor >> visit: anObject [
	anObject isNil ifTrue: [ ^ nil ].
	^ anObject accept: self
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitAll: aCollection [
	aCollection isNil ifTrue: [ ^ aCollection ].
	^ aCollection collect: [:each|
		self visit: each ]
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitAmbiguousNode: anAmbiguousNode [ 
	^ anAmbiguousNode alternatives: (self visitAll: anAmbiguousNode alternatives)

]

{ #category : #visiting }
ASN1RewriteVisitor >> visitAssignmentNode: anAssignmentNode [ 
	anAssignmentNode left: (self visit: anAssignmentNode left).
	anAssignmentNode right: (self visit: anAssignmentNode right).
	^ anAssignmentNode
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitCollectionNode: aCollection [ 
	^ aCollection elements: (self visitAll: aCollection elements)
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitComponentTypeListNode: aComponentTypeList [ 
	aComponentTypeList components: (self visitAll: aComponentTypeList components).
	^ aComponentTypeList 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitComponentTypeNode: aComponentTypeNode [ 
	aComponentTypeNode type type: (self visit: aComponentTypeNode type type).
	aComponentTypeNode modifiers: (self visit: aComponentTypeNode modifiers).
	^ aComponentTypeNode 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitConstraintNode: aNode [
	self flag: #disabledForNow.
	"aNode constraint: (self visit: aNode constraint)."
	aNode exception: (self visit: aNode exception).
	^ aNode
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode [
	^ aDefaultSyntaxClassNode fields: (self visitAll: aDefaultSyntaxClassNode fields).

]

{ #category : #visiting }
ASN1RewriteVisitor >> visitDefinedSyntaxClassNode: aDefinedSyntaxClass [ 
	aDefinedSyntaxClass fields: (self visitAll: aDefinedSyntaxClass fields).
	aDefinedSyntaxClass syntax: (self visit: aDefinedSyntaxClass syntax).
	^ aDefinedSyntaxClass 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitDefinedSyntaxObjectNode: aDefinedSyntaxObjectNode [
	| parsed objectClass |
	"Process syntax for possible rewrites. For defined syntax objects the type information
	for a field value is stored in its class. We need to iterate all possible keys and resolve
	the type for that field in the class. With the type information we set the closest type
	definition to allow to acquire type information if needed"
	parsed := aDefinedSyntaxObjectNode parseSyntax.
	objectClass := aDefinedSyntaxObjectNode type definition.
	aDefinedSyntaxObjectNode syntax: (aDefinedSyntaxObjectNode syntax collect: [:each |
		each isLiteralNode 
			ifTrue: [ each ]
			ifFalse: [  
				(parsed keyAtIdentityValue: each) in: [ :key | 
					ASN1ClosestTypeDefinition 
						use: (objectClass fieldAt: key)
						during: [self visit: each ] ] ] 
	]).
	^ aDefinedSyntaxObjectNode 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitElementsNode: anElements [
	anElements entity: (self visit: anElements entity).
	anElements exclusions: (self visitAll: anElements exclusions).
	^ anElements
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitFieldSpecNode: aFieldSpec [ 
	aFieldSpec type: (self visit: aFieldSpec type).
	^ aFieldSpec 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitImportNode: anImport [
	anImport moduleIdentifier: (self visit: anImport moduleIdentifier).
	anImport symbols: (self visitAll: anImport symbols).
	^ anImport
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitIntegerNode: anInteger [
	^ (self visitTypeNode: anInteger)
		namedNumbers: (self visitAll: anInteger namedNumbers).

]

{ #category : #visiting }
ASN1RewriteVisitor >> visitModifierDefaultValueNode: aNode [ 
	aNode value: (self visit: aNode value).
	^ aNode
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitModuleDefinitionNode: aModuleDefinition [
	self flag: #incomplete.
	aModuleDefinition identifier: (self visit: aModuleDefinition identifier).
	aModuleDefinition exports: (self visitAll: aModuleDefinition exports).
	aModuleDefinition imports: (self visitAll: aModuleDefinition imports).
	aModuleDefinition assignments: (self visitAll: aModuleDefinition assignments).
	^ aModuleDefinition 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitModuleIdentifierNode: aModuleIdentifierNode [ 
	^ aModuleIdentifierNode oid: (self visit: aModuleIdentifierNode oid)
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitNamedTypeNode: aNamedType [ 
	aNamedType type: (self visit: aNamedType type).
	^ aNamedType 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitObjectIdentifierNode: anObjectId [
	self 
		provideType: anObjectId type 
		during: [   
			anObjectId components: (self visitAll: anObjectId components).
			^ anObjectId ]
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitObjectSetNode: anObjectSetNode [
	^ anObjectSetNode elementsSpec: (self visit: anObjectSetNode elementsSpec)

]

{ #category : #visiting }
ASN1RewriteVisitor >> visitParameterNode: aParameterNode [ 
	^ ASN1Parameter new
		name: aParameterNode reference label;
		type: (self visit: aParameterNode type)
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitPrimitiveValueNode: aPrimitiveValueNode [
	^ aPrimitiveValueNode 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitReferenceNode: aReferenceNode [
	aReferenceNode type ifNotNil: [
		aReferenceNode type: (self visit: aReferenceNode type)].
	aReferenceNode hasParameters ifTrue: [
		aReferenceNode parameters: (self visitAll: aReferenceNode parameters) ].
	^ aReferenceNode
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitRoot: aRoot [
	aRoot modules: (self visitAll: aRoot modules).
	^ aRoot
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitSelectionTypeNode: aSelectionTypeNode [ 
	^ aSelectionTypeNode type: (self visit: aSelectionTypeNode type)
	
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitTaggedTypeNode: aNode [
	| type |
	aNode tag: (self visit: aNode tag).
	type := (self visit: aNode type).
	aNode type: type. 
	^ aNode
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitTypeFieldNode: aTypeFieldNode [ 
	aTypeFieldNode type: (self visit: aTypeFieldNode type).
	aTypeFieldNode fields: (self visitAll: aTypeFieldNode fields).
	^ aTypeFieldNode 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitTypeFromObjectNode: aTypeFromObject [ 
	aTypeFromObject object: (self visit: aTypeFromObject object).
	^ aTypeFromObject 
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitTypeNode: aTypeNode [
	^ aTypeNode constraints: (self visitAll: aTypeNode constraints)

]

{ #category : #visiting }
ASN1RewriteVisitor >> visitUnionNode: aUnion [
	aUnion elements: (self visitAll: aUnion elements).
	^ aUnion
]

{ #category : #visiting }
ASN1RewriteVisitor >> visitValueSetNode: aValueSet [ 
	^ aValueSet elementsSpec: (self visit: aValueSet elementsSpec)
]
