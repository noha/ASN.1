Class {
	#name : #ASN1PrimitiveCodec,
	#superclass : #Object,
	#classInstVars : [
		'utcTimeParser'
	],
	#category : 'ASN1-Codec'
}

{ #category : #decoding }
ASN1PrimitiveCodec class >> decodePrintablestring: anOrderedCollection [ 
	self shouldBeImplemented.
]

{ #category : #decoding }
ASN1PrimitiveCodec class >> decodeUtctime: aString [ 
self halt.
	^ self utcTimeParser parse: aString.
]

{ #category : #accessing }
ASN1PrimitiveCodec class >> utcTimeParser [
	^ utcTimeParser ifNil: [
		utcTimeParser := ASN1UTCTimeParser new ]
]
