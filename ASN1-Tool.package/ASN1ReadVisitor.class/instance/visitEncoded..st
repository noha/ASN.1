as yet unclassified
visitEncoded: aType
	^ self 
		push: ((self tagEnvironmentOf: aType)
			decode: stack top using: aType)
		during: [ self visit: aType ]