accessing
at: aKey
	| index |
	index := keys indexOf: aKey.
	^ (index > 0)
		ifTrue: [ values at: index ]
		ifFalse: [ nil ]