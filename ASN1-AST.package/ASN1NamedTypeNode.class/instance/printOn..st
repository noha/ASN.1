printing
printOn: aStream
	aStream 
		nextPutAll: '[named type] ';
		nextPutAll: name printString;
		nextPut: $=;
		nextPutAll: type printString;
		nextPut: $.