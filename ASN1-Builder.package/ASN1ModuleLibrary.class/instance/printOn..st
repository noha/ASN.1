printing
printOn: aStream
	aStream
		nextPutAll: self name;
		nextPutAll: ' module library'