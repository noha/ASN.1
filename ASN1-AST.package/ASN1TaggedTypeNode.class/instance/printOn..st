printing
printOn: aStream
	aStream 
		nextPutAll: type printString.
	modifier ifNotNil: [
		aStream
			nextPut: $:;
			nextPutAll: modifier printString ].
	aStream
		nextPutAll: 'TAG-';
		nextPutAll: self tag printString
