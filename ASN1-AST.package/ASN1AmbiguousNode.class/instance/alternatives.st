accessing
alternatives
	^ alternatives ifNil: [
		alternatives := OrderedCollection new ]