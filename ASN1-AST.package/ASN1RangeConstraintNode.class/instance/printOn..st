printing
printOn: aStream
	aStream
		nextPutAll: 'range(';
		nextPutAll: lowerValue printString;
		nextPutAll: '..';
		nextPutAll: upperValue printString;
		nextPutAll: ')'