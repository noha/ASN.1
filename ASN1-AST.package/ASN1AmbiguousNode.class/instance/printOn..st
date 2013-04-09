printing
printOn: aStream
	aStream nextPutAll: 'ambiguous<'.
	self alternatives 
		do: [:alternative| alternative printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $>