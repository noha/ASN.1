accessing
moduleNamed: aString
	^ (self perform: (self selectorNameFrom: aString) asSymbol )