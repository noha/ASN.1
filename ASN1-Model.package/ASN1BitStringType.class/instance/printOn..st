printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	self namedBits 
		do: [ : each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $)