printing
printOn: aStream
	aStream
		nextPutAll: 'oid '; 
		nextPutAll: contents asString