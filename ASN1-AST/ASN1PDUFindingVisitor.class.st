Class {
	#name : #ASN1PDUFindingVisitor,
	#superclass : #ASN1ASTVisitor,
	#instVars : [
		'candidates'
	],
	#category : 'ASN1-AST-Visitor'
}

{ #category : #accessing }
ASN1PDUFindingVisitor >> candidates [
	^ candidates ifNil: [
		candidates := Dictionary new ]
]

{ #category : #visiting }
ASN1PDUFindingVisitor >> visitAssignmentNode: aNode [
	(aNode right isTypeNode & aNode right isPrimitiveNode not)
		ifTrue: [ self visit: aNode right ]
		ifFalse: [ candidates removeKey: aNode right ifAbsent: []  ].

]

{ #category : #visiting }
ASN1PDUFindingVisitor >> visitModuleDefinitionNode: aNode [
	aNode assignments do: [:each| self candidates at: each right put: each left].
	self visitAll: aNode assignments.
]

{ #category : #visiting }
ASN1PDUFindingVisitor >> visitReferenceNode: aNode [
	candidates removeKey: aNode definition ifAbsent: [].
	super visitReferenceNode: aNode.

]
