accessing
namedNumbers
	^ namedNumbers ifNil: [
		namedNumbers := OrderedCollection new ]