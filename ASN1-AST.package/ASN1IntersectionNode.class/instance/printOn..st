printing
printOn: aStream
	elements ifNotNil: [
		aStream nextPut: $(.
		elements
			do: [:elem| elem printOn: aStream ]
			separatedBy: [ aStream nextPutAll: ' ^ '].
		aStream nextPut: $) ]