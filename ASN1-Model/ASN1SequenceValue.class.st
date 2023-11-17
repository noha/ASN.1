Class {
	#name : #ASN1SequenceValue,
	#superclass : #ASN1ValueObject,
	#instVars : [
		'elements'
	],
	#category : 'ASN1-Model'
}

{ #category : #accessing }
ASN1SequenceValue >> elements [
	^ elements
]

{ #category : #accessing }
ASN1SequenceValue >> elements: anObject [
	elements := anObject
]
