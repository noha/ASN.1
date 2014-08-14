accessing
value: aString
	aString withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	self bits add: (self type bitAtIndex: (aString size - index)) ]]