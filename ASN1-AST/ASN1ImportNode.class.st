Class {
	#name : #ASN1ImportNode,
	#superclass : #ASN1ASTNode,
	#instVars : [
		'moduleIdentifier',
		'symbols'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #'as yet unclassified' }
ASN1ImportNode class >> nodes: aCollection [
	^ self new 
		nodes: aCollection
]

{ #category : #visiting }
ASN1ImportNode >> accept: anASN1Visitor [ 
	^ anASN1Visitor visitImportNode: self
]

{ #category : #accessing }
ASN1ImportNode >> moduleIdentifier [
	^ moduleIdentifier
]

{ #category : #accessing }
ASN1ImportNode >> moduleIdentifier: anObject [
	moduleIdentifier := anObject
]

{ #category : #printing }
ASN1ImportNode >> printOn: aStream [
	self moduleIdentifier printOn: aStream.
	aStream nextPut: Character cr.
	self symbols isEmpty ifFalse: [ aStream nextPut: Character tab ].
	self symbols 
		do: [:symbol| aStream nextPutAll: symbol printString ] 
		separatedBy: [ 
			aStream nextPut: Character cr.
			aStream nextPut: Character tab ].
	aStream nextPut: Character cr.
]

{ #category : #accessing }
ASN1ImportNode >> symbols [
	^ symbols
]

{ #category : #accessing }
ASN1ImportNode >> symbols: anObject [
	symbols := anObject
]
