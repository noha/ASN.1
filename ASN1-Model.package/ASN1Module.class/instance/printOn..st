printing
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPut: $:;
		nextPutAll: self name;
		nextPutAll: ' (';
		nextPutAll: oid printString;
		nextPutAll: ')'