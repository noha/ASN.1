Class {
	#name : #ASN1ObjectIdentifierTypeNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ObjectIdentifierTypeNode >> accept: aVisitor [ 
	^ aVisitor visitObjectIdentifierTypeNode: self
]

{ #category : #accessing }
ASN1ObjectIdentifierTypeNode >> name [
	^ name
]

{ #category : #accessing }
ASN1ObjectIdentifierTypeNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1ObjectIdentifierTypeNode >> printOn: aStream [
	aStream nextPutAll: name printString
]
