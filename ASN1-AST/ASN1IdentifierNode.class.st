Class {
	#name : #ASN1IdentifierNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'name'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1IdentifierNode class >> name: aString [
	^ self new 
		name: aString
]

{ #category : #accessing }
ASN1IdentifierNode >> name [
	^ name
]

{ #category : #accessing }
ASN1IdentifierNode >> name: anObject [
	name := anObject
]

{ #category : #printing }
ASN1IdentifierNode >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPut: $[;
		nextPutAll: self name;
		nextPut: $]
]
