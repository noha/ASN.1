printing
printOn: aStream
	aStream 
		nextPutAll: 'default value=';
		nextPutAll: value asString