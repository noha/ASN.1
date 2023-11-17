Class {
	#name : #ASN1EncodedValue,
	#superclass : #ASN1StreamValue,
	#instVars : [
		'tag'
	],
	#category : 'ASN1-Codec'
}

{ #category : #'as yet unclassified' }
ASN1EncodedValue class >> newFrom: anObject [
	^ self new
		initializeFrom: anObject
]

{ #category : #converting }
ASN1EncodedValue >> asByteArray [
	^ ByteArray streamContents: [:stream|
		(ASN1 codecStreamClass on: stream)
			nextPut: self ]
]

{ #category : #accessing }
ASN1EncodedValue >> baseValue [
	^ self 
]

{ #category : #testing }
ASN1EncodedValue >> isAsn1EncodedValue [
	^ true
]

{ #category : #testing }
ASN1EncodedValue >> isConstructed [
	self subclassResponsibility 
]

{ #category : #accessing }
ASN1EncodedValue >> tag [
	^ tag
]

{ #category : #accessing }
ASN1EncodedValue >> tag: anObject [
	tag := anObject
]

{ #category : #accessing }
ASN1EncodedValue >> tagByteValue [
	^(Array streamContents: [:str | self tag writeOn:  str constructed: self isConstructed] ) first
]
