accessing
binaryStringValue: aString

	aString withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	self bits add: (self type bitAtIndex: index - 1) ]]