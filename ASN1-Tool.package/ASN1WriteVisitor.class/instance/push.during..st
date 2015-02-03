as yet unclassified
push: anObject during: aBlock
	|  formerValue |
	anObject ifNil: [  Error signal: 'cannot push nil onto stack' ].
	formerValue := currentValue.
	currentValue := anObject.
	^aBlock ensure: [ currentValue := formerValue ]