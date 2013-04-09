printing
printOn: aStream
	aStream 
		nextPutAll: 'assignment ';
		nextPut: Character cr;
		nextPut: Character tab;
		nextPutAll: 'left: ';
		nextPutAll: self left printString.
	aStream
		nextPut: Character cr;
		nextPut: Character tab;
		nextPutAll: 'right: ';
		nextPutAll: self right printString;
		nextPut: Character cr