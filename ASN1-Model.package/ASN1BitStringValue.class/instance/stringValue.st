accessing
stringValue
	| number |
	number := 0.
	self bits do: [ :each|
		number := number bitOr: (1 bitShift: (self type bitIndexOf: each)) ].
	^ number print