printing
printOn: aStream
	aStream 
		nextPutAll: name asString;
		nextPutAll: ' -> ';
		nextPutAll: value asString