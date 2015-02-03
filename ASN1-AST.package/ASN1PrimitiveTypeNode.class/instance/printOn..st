printing
printOn: aStream
	aStream 
		nextPutAll: 'primitive [';
		nextPutAll: name printString;
		nextPutAll: '] '.
	super printOn: aStream