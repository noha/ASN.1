printing
printOn: aStream
	aStream 
		nextPutAll: 'object from defined syntax [ ';
		nextPutAll: syntax printString;
		nextPutAll: ' ]'