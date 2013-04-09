visiting
visitIntegerNode: anInteger
	^ (self visitTypeNode: anInteger)
		namedNumbers: (self visitAll: anInteger namedNumbers).
