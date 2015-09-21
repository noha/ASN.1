printing
printOn: aStream
	bits 
		do: [ :each | aStream nextPutAll: each ]
		separatedBy: [ aStream nextPut: $, ].
	aStream nextPutAll: ' ['.
	type printOn: aStream.
	aStream nextPutAll: ']'