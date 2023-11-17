Class {
	#name : #ASN1TypedSetNode,
	#superclass : #ASN1TypedCollectionNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TypedSetNode >> accept: aVisitor [ 
	^ aVisitor visitTypedSetNode: self
]
