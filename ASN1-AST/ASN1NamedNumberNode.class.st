Class {
	#name : #ASN1NamedNumberNode,
	#superclass : #ASN1TypeNode,
	#instVars : [
		'name',
		'number'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1NamedNumberNode class >> name: aString number: aNumber [
	^ self new
		name: aString;
		number: aNumber
]

{ #category : #'as yet unclassified' }
ASN1NamedNumberNode >> accept: aVisitor [
	^ aVisitor visitNamedNumberNode: self 
]

{ #category : #accessing }
ASN1NamedNumberNode >> name [
	^ name
]

{ #category : #accessing }
ASN1NamedNumberNode >> name: anObject [
	name := anObject
]

{ #category : #accessing }
ASN1NamedNumberNode >> number [
	^ number
]

{ #category : #accessing }
ASN1NamedNumberNode >> number: anObject [
	number := anObject
]

{ #category : #printing }
ASN1NamedNumberNode >> printOn: aStream [
	aStream 
		nextPutAll: 'named number: ';
		nextPutAll: name printString;
		nextPut: $(;
		nextPutAll: number printString;
		nextPut: $)
]
