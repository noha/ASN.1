printing
printOn: aStream
	aStream nextPutAll: (self class name copyFrom: 5 to: self class name size)