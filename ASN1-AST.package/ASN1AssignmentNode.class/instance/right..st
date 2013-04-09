accessing
right: anObject
	right isString ifTrue: [ self halt ].
	right := anObject