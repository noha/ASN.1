accessing
binaryStringValue
	| number |
	number := 0.
	self bits do: [ :each|
		number := number bitOr: (1 bitShift: (self type bitIndexOf: each)) ].
	^ number printStringBase: 2 length: type numberOfBits padded: true