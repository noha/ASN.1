Class {
	#name : #ASN1IntersectionNode,
	#superclass : #ASN1ArithmeticNode,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1IntersectionNode >> accept: aVisitor [
	^ aVisitor visitIntersectionNode: self
]

{ #category : #accessing }
ASN1IntersectionNode >> elements [
	^ elements
]

{ #category : #accessing }
ASN1IntersectionNode >> elements: anObject [
	elements := anObject
]

{ #category : #printing }
ASN1IntersectionNode >> printOn: aStream [
	elements ifNotNil: [
		aStream nextPut: $(.
		elements
			do: [:elem| elem printOn: aStream ]
			separatedBy: [ aStream nextPutAll: ' ^ '].
		aStream nextPut: $) ]
]

{ #category : #accessing }
ASN1IntersectionNode >> type: anObject [
	elements type: anObject
]
