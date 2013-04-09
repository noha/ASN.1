printing
printOn: aStream
	aStream 
		nextPutAll: reference printString.
	type ifNotNil: [
		aStream
			nextPutAll: ' (';
			nextPutAll: type printString;
			nextPut: $) ]