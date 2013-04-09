printing
printOn: aStream
	aStream
		nextPutAll: label printString.
	aStream nextPut: $<.
	self type ifNotNil: [
		self type printOn: aStream ].
	aStream nextPut: $> .
	self parameters notNil ifTrue: [
		self parameters printElementsOn: aStream ].
	super printOn: aStream