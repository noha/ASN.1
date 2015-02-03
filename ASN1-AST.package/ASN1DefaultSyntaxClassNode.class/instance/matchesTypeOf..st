testing
matchesTypeOf: anObject 
	anObject type ifNil: [ Error signal: 'cannot  find type for ', anObject printString ].
	^ anObject type class = self class.
