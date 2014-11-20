as yet unclassified
push: anObject during: aBlock
	| result formerValue |
	anObject ifNil: [  Error signal: 'cannot push nil onto stack' ].
	formerValue := currentValue.
	currentValue := anObject.
	[ result := aBlock value ]
		ensure: [ currentValue := formerValue ]. 
	^ result