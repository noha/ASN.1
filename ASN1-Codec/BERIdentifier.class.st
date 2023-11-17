Class {
	#name : #BERIdentifier,
	#superclass : #BERStreamFormat,
	#instVars : [
		'tag',
		'constructed'
	],
	#category : 'ASN1-Codec-BER'
}

{ #category : #'as yet unclassified' }
BERIdentifier class >> isConstructed: anOctet [
	^ (anOctet bitAnd: 16r20) > 0
]

{ #category : #'as yet unclassified' }
BERIdentifier class >> parseFrom: aStream [
	| octet |
	octet := (self nextFrom: aStream) asInteger.
	^ self new
		tag: (ASN1Tag 
			clazz: (ASN1Tag classLabelOf: (octet bitShift: -6))
			number: (self readNumberFrom: octet stream: aStream));
		constructed: (self isConstructed: octet).


]

{ #category : #'as yet unclassified' }
BERIdentifier class >> readHighTagNumber: aStream [
	^ self readMultipleOctetsWithHighBitSet: aStream
]

{ #category : #'as yet unclassified' }
BERIdentifier class >> readNumberFrom: anOctet stream: aStream [
	| number |
	number := anOctet bitAnd: 16r1F.
	(number = 16r1F) ifTrue: [
		^ self readHighTagNumber: aStream ].
	^ number
]

{ #category : #accessing }
BERIdentifier >> constructed [
	^ constructed
]

{ #category : #accessing }
BERIdentifier >> constructed: anObject [
	constructed := anObject
]

{ #category : #testing }
BERIdentifier >> isConstructed [
	^ constructed
]

{ #category : #printing }
BERIdentifier >> printOn: aStream [
	tag printOn: aStream.
	aStream 
		nextPutAll: ' - ';
		nextPutAll: (self isConstructed 
			ifTrue: [ 'constructed' ] 
			ifFalse: [ ' primitive' ])		
]

{ #category : #accessing }
BERIdentifier >> tag [
	^ tag
]

{ #category : #accessing }
BERIdentifier >> tag: anObject [
	tag := anObject
]

{ #category : #'as yet unclassified' }
BERIdentifier >> writeOn: aStream [
	self tag writeOn: aStream constructed: constructed
]
