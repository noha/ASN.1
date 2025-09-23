Class {
	#name : 'ASN1ObjectNode',
	#superclass : 'ASN1ASTNode',
	#instVars : [
		'attributes'
	],
	#category : 'ASN1-AST-Nodes',
	#package : 'ASN1-AST',
	#tag : 'Nodes'
}

{ #category : 'accessing' }
ASN1ObjectNode >> attributes [
	^ attributes
]

{ #category : 'accessing' }
ASN1ObjectNode >> attributes: anObject [
	attributes := anObject
]
