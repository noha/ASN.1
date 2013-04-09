visiting
visit: anObject
	anObject isNil ifTrue: [ ^ nil ].
	^ anObject accept: self