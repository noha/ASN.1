accessing
value: anObject
	anObject ifNil: [  self halt ].
	anObject isAsn1 ifFalse: [ self halt ].
	value := anObject