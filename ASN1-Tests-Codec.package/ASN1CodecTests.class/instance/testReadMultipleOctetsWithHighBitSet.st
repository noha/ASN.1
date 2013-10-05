tests
testReadMultipleOctetsWithHighBitSet
	| array result |
	array := ByteArray streamContents: [:stream|
		stream 
			nextPut: 16r81;
			nextPut: 16r82;
			nextPut: 16r3 ].
	result := BERStreamFormat readMultipleOctetsWithHighBitSet: array readStream.
	self assert: result = 16643