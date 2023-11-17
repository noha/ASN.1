Class {
	#name : #ASN1BinaryBitStringValueNode,
	#superclass : #ASN1BitStringValueNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1BinaryBitStringValueNode >> accept: aVisitor [ 
	^ aVisitor visitBinaryBitStringValueNode: self 
]
