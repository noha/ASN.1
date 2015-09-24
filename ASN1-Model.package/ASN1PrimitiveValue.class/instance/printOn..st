printing
printOn: aStream
	contents printOn: aStream.
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'