accessing
setBitValues: aCollection
	| number |
	number := 0.
	aCollection do: [ :bitNumber |
		number := number bitOr: (2 raisedTo: bitNumber asNumber)
	].
	self resolvedValue: (number printStringBase: 2)