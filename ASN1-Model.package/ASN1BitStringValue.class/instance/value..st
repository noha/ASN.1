accessing
value: aString
	aString withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
			| bit |
			bit := self type bitAtIndex: index - 1.
			bit ifNotNil: [self bits add: bit]]]