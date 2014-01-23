printing
printOn: aStream
	aStream 
		nextPutAll: '[component type] ';
		nextPutAll: name printString;
		nextPut: $=;
		nextPutAll: type printString;
		nextPut: $. .
	modifiers ifNotNil: [ 
		modifiers printOn: aStream ]
