visiting
visitIntegerNode: anInteger
	self visitAll: anInteger namedNumbers.
	self visitTypeNode: anInteger.
	^ anInteger