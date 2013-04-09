printing
printOn: aStream
	name printOn: aStream.
	aStream nextPut: $(.
	value printOn: aStream.
	aStream nextPut: $)