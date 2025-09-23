Class {
	#name : 'ASN1TypedSetNode',
	#superclass : 'ASN1TypedCollectionNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1TypedSetNode >> accept: aVisitor [ 
	^ aVisitor visitTypedSetNode: self
]
