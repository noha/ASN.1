Class {
	#name : #ASN1ParameterNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'type',
		'reference'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #visiting }
ASN1ParameterNode >> accept: aVisitor [ 
	aVisitor visitParameterNode: self
]

{ #category : #binding }
ASN1ParameterNode >> bindingOf: aString [
	^ (reference label = aString) 
		ifTrue: [ type ]
		ifFalse: [ nil ]
]

{ #category : #printing }
ASN1ParameterNode >> printOn: aStream [
	aStream 
		nextPutAll: reference printString.
	type ifNotNil: [
		aStream
			nextPutAll: ' (';
			nextPutAll: type printString;
			nextPut: $) ]
]

{ #category : #accessing }
ASN1ParameterNode >> reference [
	^ reference
]

{ #category : #accessing }
ASN1ParameterNode >> reference: anObject [
	reference := anObject
]

{ #category : #accessing }
ASN1ParameterNode >> type [
	^ type
]

{ #category : #accessing }
ASN1ParameterNode >> type: anObject [
	type := anObject
]
