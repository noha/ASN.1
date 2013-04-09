parsing
parse: aStream into: aDictionary
	aStream next ifNotNil: [:val|
		aDictionary at: label put: val]