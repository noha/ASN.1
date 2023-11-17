Class {
	#name : #ASN1SetNode,
	#superclass : #ASN1CollectionNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1SetNode >> accept: aVisitor [
	^ aVisitor visitSetNode: self 
]
