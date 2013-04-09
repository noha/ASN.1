printing
printOn: aStream
	aStream nextPutAll: 'CHOICE{'.
	super printOn: aStream.
	aStream nextPut: $}