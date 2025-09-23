Class {
	#name : 'ASN1SequenceValueNode',
	#superclass : 'ASN1ValueCollectionNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1SequenceValueNode >> accept: aVisitor [
	^ aVisitor visitSequenceValueNode: self
]

{ #category : 'accessing' }
ASN1SequenceValueNode >> defaultTypeClass [
	 ^ ASN1SequenceNode 
]
