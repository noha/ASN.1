printing
printOn: aStream
	aStream 
		nextPutAll: 'named number: ';
		nextPutAll: name printString;
		nextPut: $(;
		nextPutAll: number printString;
		nextPut: $)