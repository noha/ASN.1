printing
printOn: aStream
	aStream nextPutAll: 'SEQUENCE{'.
	super printOn: aStream.
	aStream nextPut: $}