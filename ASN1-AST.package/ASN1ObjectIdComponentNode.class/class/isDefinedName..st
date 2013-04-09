testing
isDefinedName: aString
	self definedNumbers 
		at: aString
		ifPresent: [ ^ true ].
	^ false