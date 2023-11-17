Class {
	#name : #ASN1HexBitStringValueNode,
	#superclass : #ASN1BitStringValueNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1HexBitStringValueNode >> accept: aVisitor [ 
	^ aVisitor visitHexBitStringValueNode: self 
]
