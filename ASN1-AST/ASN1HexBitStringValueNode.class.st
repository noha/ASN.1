Class {
	#name : 'ASN1HexBitStringValueNode',
	#superclass : 'ASN1BitStringValueNode',
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'visiting' }
ASN1HexBitStringValueNode >> accept: aVisitor [ 
	^ aVisitor visitHexBitStringValueNode: self 
]
