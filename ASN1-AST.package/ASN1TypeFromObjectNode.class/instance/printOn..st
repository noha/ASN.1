printing
printOn: aStream
	aStream
		nextPutAll: self object printString;
		nextPut: $.;
		nextPutAll: self field printString 