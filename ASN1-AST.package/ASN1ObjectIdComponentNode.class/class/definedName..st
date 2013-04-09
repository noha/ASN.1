instance creation
definedName: aString
	^ self new
		name: aString;
		number: (self definedNumbers at: aString)