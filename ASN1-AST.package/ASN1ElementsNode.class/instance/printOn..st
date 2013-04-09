printing
printOn: aStream
	entity printOn: aStream.
	exclusions ifNotNil: [
		aStream nextPutAll: ' - '.
		exclusions printOn: aStream ]