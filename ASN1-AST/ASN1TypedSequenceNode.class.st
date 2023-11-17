Class {
	#name : #ASN1TypedSequenceNode,
	#superclass : #ASN1TypedCollectionNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TypedSequenceNode >> accept: aVisitor [ 
	^ aVisitor visitTypedSequenceNode: self
]
