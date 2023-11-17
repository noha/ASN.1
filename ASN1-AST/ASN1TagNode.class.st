Class {
	#name : #ASN1TagNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'encodingReference',
		'tagClass',
		'tagNumber'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1TagNode >> accept: aVisitor [ 
	^ aVisitor visitTagNode: self
]

{ #category : #accessing }
ASN1TagNode >> encodingReference [
	^ encodingReference
]

{ #category : #accessing }
ASN1TagNode >> encodingReference: anObject [
	encodingReference := anObject
]

{ #category : #printing }
ASN1TagNode >> printOn: aStream [
	aStream nextPut: $[.
	encodingReference ifNotNil: [
		aStream
			nextPutAll: encodingReference printString;
			nextPut: $:
	].
	self tagClass ifNotNil: [
	aStream 
		nextPutAll: self tagClass printString;
		nextPut: $:].
	aStream
		nextPutAll: self tagNumber printString.
	aStream nextPut: $]
]

{ #category : #accessing }
ASN1TagNode >> tagClass [
	^ tagClass
]

{ #category : #accessing }
ASN1TagNode >> tagClass: anObject [
	tagClass := anObject
]

{ #category : #accessing }
ASN1TagNode >> tagNumber [
	^ tagNumber
]

{ #category : #accessing }
ASN1TagNode >> tagNumber: anObject [
	tagNumber := anObject
]
