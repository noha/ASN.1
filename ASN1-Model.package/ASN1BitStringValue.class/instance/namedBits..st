accessing
namedBits: aCollection
	"encode aCollection of named bits into there binary string representation. Bits need to be
	kept in binary form because there can be bit strings without named bits"
	| number |
	number := 0.
	(type bitNames includesAll: aCollection) ifFalse: [ 
			Error signal: 'bit string does not understand bit names: ', (aCollection difference: type bitNames) asString  ].		

	aCollection do: [ :each|
		number := number bitOr: (1 bitShift: (self type indexOfBitNamed: each)) ].
	contents := (number printStringBase: 2 length: type namedBits size padded: true) reversed