as yet unclassified
writeOn: aStream
	aStream nextPut: (self tag byteValue: constructed)