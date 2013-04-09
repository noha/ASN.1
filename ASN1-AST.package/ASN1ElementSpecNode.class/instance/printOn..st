printing
printOn: aStream
	aStream
		nextPut: $(;
		nextPutAll: elementsSpec printString;
		nextPut: $)