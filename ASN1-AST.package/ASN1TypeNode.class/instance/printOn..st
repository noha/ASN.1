printing
printOn: aStream
	super printOn: aStream.
	self constraints notNil ifTrue: [
		aStream nextPut: $(.
		self constraints 
			do: [:constraint| constraint printOn: aStream ]
			separatedBy: [ aStream nextPut: $, ].
		aStream nextPut: $)
	].
	self propertyAt: #modifier ifPresent: [:modifier|
		aStream
			nextPut: $:;
			nextPutAll: modifier printString ].
	aStream
		nextPutAll: 'TAG-';
		nextPutAll: self tag printString