Class {
	#name : #ASN1ExternalTypeNode,
	#superclass : #ASN1TypeNode,
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ExternalTypeNode >> accept: aVisitor [ 
	^ aVisitor visitExternalNode: self
]

{ #category : #printing }
ASN1ExternalTypeNode >> printOn: aStream [
	aStream nextPutAll: 'EXTERNAL'
]
