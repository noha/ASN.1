printing
printOn: aStream
	aStream nextPutAll: 'BitString('.
	bits ifNotNil: [
		bits do: [:each| each printOn: aStream ]
		separatedBy: [ aStream nextPut: $, ]].
	aStream nextPut: $)