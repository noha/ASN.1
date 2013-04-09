printing
printOn: aStream
	aStream
		nextPut: $[;
		nextPutAll: self class name printString;
		nextPut: $].