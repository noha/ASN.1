printing
printOn: aStream
	aStream 
		nextPutAll: self name printString;
		nextPutAll: ' (';
		nextPutAll: self number printString;
		nextPut: $)