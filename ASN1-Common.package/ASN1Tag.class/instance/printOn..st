printing
printOn: aStream
	aStream
		nextPutAll: (self clazz ifNil: [ 'CONTEXT' ]);
		nextPut: $:;
		nextPutAll: self number printString