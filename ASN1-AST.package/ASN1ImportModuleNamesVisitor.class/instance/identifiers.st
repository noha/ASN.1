accessing
identifiers
	^ identifiers ifNil: [
		identifiers := OrderedCollection new ]