accessing
value: anObject
	anObject ifNil: [  self halt ].
	value := anObject