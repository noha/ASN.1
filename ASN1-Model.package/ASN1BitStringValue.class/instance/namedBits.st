accessing
namedBits
	"decode binary contents into there named counterparts"
	| namedBits |
	contents ifNil: [ ^ #() ].
	namedBits := OrderedCollection new.
	contents withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	namedBits add: (self type bitNameAtIndex: index - 1) ]].
	^ namedBits