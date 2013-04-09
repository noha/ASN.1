printing
printOn: aStream
	aStream
		nextPutAll: key printString;
		nextPutAll: ' -> ';
		nextPutAll: value printString