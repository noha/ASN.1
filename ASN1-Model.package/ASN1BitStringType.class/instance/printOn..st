printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	self bits 
		do: [ : each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)