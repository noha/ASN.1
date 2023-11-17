Class {
	#name : #ASN1NullTypeNode,
	#superclass : #ASN1TypeNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1NullTypeNode >> accept: aVisitor [ 
	^ aVisitor visitNullTypeNode: self
]

{ #category : #printing }
ASN1NullTypeNode >> printOn: aStream [
	aStream nextPutAll: 'NULL'
]
