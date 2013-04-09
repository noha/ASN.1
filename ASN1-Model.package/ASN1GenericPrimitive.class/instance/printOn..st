printing
printOn: aStream
	aStream
		nextPut: $[; 
		nextPutAll: type printString;
		nextPut: $]