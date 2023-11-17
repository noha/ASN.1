Class {
	#name : #ASN1BMPStringType,
	#superclass : #ASN1PrimitiveType,
	#category : 'ASN1-Model'
}

{ #category : #codec }
ASN1BMPStringType class >> decode: aByteArray [
	| byteStream |
	((aByteArray size \\ 2) = 0) ifFalse: [ Error signal: 'encoded BMPString needs to have an odd number of octets' ].
	byteStream := aByteArray readStream.
	^ String streamContents: [ :stream |
		[ byteStream atEnd ] whileFalse: [  
			stream nextPut: (Character value: (byteStream next: 2) asInteger) ] ]
]

{ #category : #codec }
ASN1BMPStringType class >> encode: aString [
	^ ByteArray streamContents: [ :stream | 
		aString do: [ :char | | asciiValue |
			asciiValue := char asciiValue.
			(asciiValue > 16rFFFF) ifTrue: [ Error signal: 'cannot encode ', aString, ' to 16-bit' ].
			(asciiValue < 256) ifTrue: [ 
				stream nextPut: 0 ].
			stream nextPutAll: asciiValue asByteArray ]]
]

{ #category : #accessing }
ASN1BMPStringType class >> universalType [
	^ 'BMPString'
]

{ #category : #'as yet unclassified' }
ASN1BMPStringType >> accept: aVisitor [
	^ aVisitor visitPrintableString: self
]
