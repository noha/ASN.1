accessing
top
	^ parent
		ifNotNil: [ parent top ]
		ifNil: [ self ]