Class {
	#name : #ASN1ElementSpecNode,
	#superclass : #ASN1ValueNode,
	#instVars : [
		'elementsSpec'
	],
	#category : 'ASN1-AST-Nodes'
}

{ #category : #accessing }
ASN1ElementSpecNode >> elementsSpec [
	^ elementsSpec
]

{ #category : #accessing }
ASN1ElementSpecNode >> elementsSpec: anObject [
	elementsSpec := anObject
]

{ #category : #printing }
ASN1ElementSpecNode >> printOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: elementsSpec printString;
		nextPut: $)
]

{ #category : #accessing }
ASN1ElementSpecNode >> type: anObject [
	elementsSpec type: anObject
]
