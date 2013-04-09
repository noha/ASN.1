as yet unclassified
visitDecoded: anObject
	^ (self tagEnvironmentOf: anObject) 
		encode: (self visit: anObject ) using: anObject