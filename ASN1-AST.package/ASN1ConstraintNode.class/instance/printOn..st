printing
printOn: aStream
	aStream nextPut: $<. 
	constraint ifNotNil: [
		self constraint printOn: aStream ].
	aStream nextPut: $>