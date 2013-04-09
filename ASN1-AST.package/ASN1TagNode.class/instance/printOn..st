printing
printOn: aStream
	aStream nextPut: $[.
	encodingReference ifNotNil: [
		aStream
			nextPutAll: encodingReference printString;
			nextPut: $:
	].
	self tagClass ifNotNil: [
	aStream 
		nextPutAll: self tagClass printString;
		nextPut: $:].
	aStream
		nextPutAll: self tagNumber printString.
	aStream nextPut: $]