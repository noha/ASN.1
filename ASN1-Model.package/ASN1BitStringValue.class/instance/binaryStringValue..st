accessing
binaryStringValue: aString
	"store named bits taken from a binary string. Least significant bit is on the
	left side (string first). This is a lazy variant of using a bitstring. A better
	approach is to use the names instead and use the #bits: accessor"
	bits := nil.
	aString withIndexDo: [ :char :index |
		(char = $1) ifTrue: [  
		 	self bits add: (self type bitAtIndex: index - 1) ]]