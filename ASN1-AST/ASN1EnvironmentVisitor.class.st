Class {
	#name : #ASN1EnvironmentVisitor,
	#superclass : #ASN1ASTVisitor,
	#instVars : [
		'errors',
		'scope'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #accessing }
ASN1EnvironmentVisitor >> errors [
	^ errors ifNil: [
		errors := OrderedCollection new ]
]

{ #category : #actions }
ASN1EnvironmentVisitor >> popScope [
	scope := scope parent 
]

{ #category : #actions }
ASN1EnvironmentVisitor >> pushScope: aScopeObject [
	"bring aScopeObject to the front of the scope chain"
	| currentScope |
	currentScope := ASN1Scope new scopeObject: aScopeObject.
	scope ifNotNil: [
		currentScope setParent: scope ].
	scope := currentScope
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> pushScope: aScopeObject during: aBlock [
	self pushScope: aScopeObject.
	aBlock value.
	self popScope 
]

{ #category : #accessing }
ASN1EnvironmentVisitor >> root: anObject [
	self pushScope: anObject
]

{ #category : #accessing }
ASN1EnvironmentVisitor >> scope [
	^ scope
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visit: aNode [
	aNode ifNil: [ ^ self  ].
	aNode providesScope 
		ifTrue: [
			self 
				pushScope: aNode 
				during: [ super visit: aNode ]  ]
		ifFalse: [  super visit: aNode ]
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitAssignmentNode: anAssignmentNode [
	"resolve left side of assignment and its type to add the left side type as scope 
	object when resolving the right side of the assignment. A right side value
	assignment could refer to the type of the assignment which is specified oon
	the left side"
	anAssignmentNode left hasType ifTrue: [ 
		 self visit: anAssignmentNode left type ].
	self visit: anAssignmentNode left.
	
	anAssignmentNode left providesScope ifTrue: [ 
		 self pushScope: anAssignmentNode left ].
	self visit: anAssignmentNode right
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitComponentTypeNode: aNode [ 
	self 
		pushScope: aNode 
		during: [  super visitComponentTypeNode: aNode ]

]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode [ 
	self 
		pushScope: aDefaultSyntaxClassNode 
		during: [  super visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode ]

]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode [ 
	self
		pushScope: aDefinedSyntaxClassNode
		during: [  super visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode ]
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitReferenceNode: aReferenceNode [
	self 
		pushScope: aReferenceNode 
		during: [ super visitReferenceNode: aReferenceNode ]
]

{ #category : #visiting }
ASN1EnvironmentVisitor >> visitTypeFieldNode: aTypeFieldNode [
	self visit: aTypeFieldNode type.
	self 
		pushScope:  aTypeFieldNode type definition
		during: [self visitAll: aTypeFieldNode fields ] 
]
