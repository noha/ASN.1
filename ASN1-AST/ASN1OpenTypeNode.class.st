Class {
	#name : #ASN1OpenTypeNode,
	#superclass : #ASN1TypeNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1OpenTypeNode >> accept: aVisitor [
	^ aVisitor visitOpenTypeNode: self 
]

{ #category : #printing }
ASN1OpenTypeNode >> printOn: aStream [
	aStream nextPutAll: 'open type'
]
