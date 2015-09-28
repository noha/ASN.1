accessing
binaryStringValue
	"build a binary string representation from the bits set. Least significant bit is on
	the left side (string first). The resulting string has the same size as the number
	of bits in this type. Unset bits are padded with zeros"
	| number |
	number := 0.
	self bits do: [ :each|
		number := number bitOr: (1 bitShift: (self type bitIndexOf: each)) ].
	^ (number printStringBase: 2 length: type numberOfBits padded: true) reversed