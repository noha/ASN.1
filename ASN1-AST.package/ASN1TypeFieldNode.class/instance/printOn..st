printing
printOn: aStream
	aStream
		nextPutAll: self type printString.
	fields ifNotNil: [
		aStream nextPut: $..
		fields 
			do: [:each| aStream nextPutAll: each printString ]
			separatedBy: [ aStream nextPut: $. ]]