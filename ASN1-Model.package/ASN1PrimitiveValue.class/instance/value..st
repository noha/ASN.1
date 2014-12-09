accessing
value: anObject
	anObject ifNil: [ Error signal: 'cannot use nil as value' ].
	value := anObject