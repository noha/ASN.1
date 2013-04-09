printing
printOn: aStream
	self module printOn: aStream.
	aStream nextPut: Character cr.
	self symbols isEmpty ifFalse: [ aStream nextPut: Character tab ].
	self symbols 
		do: [:symbol| aStream nextPutAll: symbol printString ] 
		separatedBy: [ 
			aStream nextPut: Character cr.
			aStream nextPut: Character tab ].
	aStream nextPut: Character cr.