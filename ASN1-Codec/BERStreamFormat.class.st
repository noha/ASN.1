Class {
	#name : #BERStreamFormat,
	#superclass : #Object,
	#category : 'ASN1-Codec-BER'
}

{ #category : #reading }
BERStreamFormat class >> nextFrom: aStream [
	^ aStream next ifNil: [ 
		ASN1PrematureEndOfStream signal ]
]

{ #category : #reading }
BERStreamFormat class >> readMultipleOctets: aNumber from: aStream [
	| value |
	value := 0.
	aNumber timesRepeat: [
		value := (value bitShift: 8) bitOr: ( self nextFrom: aStream ) asInteger ].
	^ value
]

{ #category : #reading }
BERStreamFormat class >> readMultipleOctetsWithHighBitSet: aStream [	
	| octet val |
	val := 0.
	[ 	octet := self nextFrom: aStream.
		val := ((val bitShift: 7) bitOr: (octet asInteger bitAnd: 127)).
		(octet asInteger bitAnd: 128) = 128
	] whileTrue.
	^ val
]
