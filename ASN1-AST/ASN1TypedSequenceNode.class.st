Class {
	#name : 'ASN1TypedSequenceNode',
	#superclass : 'ASN1TypedCollectionNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1TypedSequenceNode >> accept: aVisitor [ 
	^ aVisitor visitTypedSequenceNode: self
]
