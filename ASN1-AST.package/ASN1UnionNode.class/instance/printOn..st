printing
printOn: aStream
	elements ifNotNil: [
		elements
			do: [:elem| elem printOn: aStream ]
			separatedBy: [ aStream nextPutAll: ' | ']
		]