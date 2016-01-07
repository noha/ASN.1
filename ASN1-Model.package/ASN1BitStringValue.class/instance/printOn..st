printing
printOn: aStream
	self namedBits 
		do: [ :each | aStream nextPutAll: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'