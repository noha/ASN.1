printing
printOn: aStream
	value printOn: aStream.
	aStream nextPutAll: '['.
	type printOn: aStream.
	aStream nextPutAll: ']'