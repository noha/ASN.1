accessing
binaryStringValue: aString
	(aString size = type numberOfBits) ifFalse: [ Error signal: 'different number of bits in string value. Expected ', type numberOfBits asString, ' but got ', aString size asString ].
	bits := nil.
	aString reverse withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	self bits add: (self type bitAtIndex: index - 1) ]]