Class {
	#name : #ASN1NamedBitNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name',
		'value'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1NamedBitNode >> accept: aVisitor [ 
	^ aVisitor visitNamedBitNode: self
]

{ #category : #accessing }
ASN1NamedBitNode >> name [
	^ name
]

{ #category : #accessing }
ASN1NamedBitNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1NamedBitNode >> printOn: aStream [
	name printOn: aStream.
	aStream nextPut: $(.
	value printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
ASN1NamedBitNode >> value [
	^ value
]

{ #category : #accessing }
ASN1NamedBitNode >> value: anObject [
	value := anObject
]
