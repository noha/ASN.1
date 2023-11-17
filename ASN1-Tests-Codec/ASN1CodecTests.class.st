Class {
	#name : #ASN1CodecTests,
	#superclass : #TestCase,
	#category : 'ASN1-Tests-Codec'
}

{ #category : #tests }
ASN1CodecTests >> testReadMultipleOctetsWithHighBitSet [
	| array result |
	array := ByteArray streamContents: [:stream|
		stream 
			nextPut: 16r81;
			nextPut: 16r82;
			nextPut: 16r3 ].
	result := BERStreamFormat readMultipleOctetsWithHighBitSet: array readStream.
	self assert: result = 16643
]
