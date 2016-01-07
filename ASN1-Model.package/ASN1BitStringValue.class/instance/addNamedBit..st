adding
addNamedBit: aString
	"add a single named bit to the binary string representation. "
	| index |
	(self type hasBitNamed: aString) ifFalse: [ Error signal: 'not a valid bit name for this type' ].
	index := (self type indexOfBitNamed: aString) + 1.
	"the bit name is checked therefor the index lays between 0 and named bits size. The actual contents
	string could be shorter than the amount of named bits. So we adjust it first before trying to set a
	value a the given index position"
	( index < self contents size ) ifFalse: [ 
		self adjustContentsSize ].
	contents at: index put: $1 	