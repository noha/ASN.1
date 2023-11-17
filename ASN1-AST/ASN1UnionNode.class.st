Class {
	#name : #ASN1UnionNode,
	#superclass : #ASN1ArithmeticNode,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1UnionNode >> accept: aVisitor [ 
	^ aVisitor visitUnionNode: self
]

{ #category : #adding }
ASN1UnionNode >> add: aNode [ 
	elements add: aNode
]

{ #category : #accessing }
ASN1UnionNode >> elements [
	^ elements
]

{ #category : #accessing }
ASN1UnionNode >> elements: anObject [
	elements := anObject asOrderedCollection 
]

{ #category : #actions }
ASN1UnionNode >> merge: aUnionNode [
	^ self class new
		elements: (elements asOrderedCollection addAll: aUnionNode elements; yourself)
]

{ #category : #printing }
ASN1UnionNode >> printOn: aStream [
	elements ifNotNil: [
		elements
			do: [:elem| elem printOn: aStream ]
			separatedBy: [ aStream nextPutAll: ' | ']
		]
]

{ #category : #accessing }
ASN1UnionNode >> size [
	^ elements isNil
		ifTrue: [ 0 ]
		ifFalse: [ elements size ]
]

{ #category : #accessing }
ASN1UnionNode >> type: anObject [
	elements do: [ :element |
		element type: anObject ]
]
