validating
acceptsValue: anObject
	^ (anObject class = ByteArray) or: [ anObject isByteString ]