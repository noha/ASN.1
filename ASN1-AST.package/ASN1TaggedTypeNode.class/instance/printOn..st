printing
printOn: aStream
	aStream 
		nextPutAll: type printString.
	aStream
		nextPutAll: 'TAG-';
		nextPutAll: self tag printString
