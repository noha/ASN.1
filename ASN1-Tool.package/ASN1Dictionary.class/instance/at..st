accessing
at: aKey
	| index |
	index := keys indexOf: aKey asn1Normalized.
	^ (index > 0)
		ifTrue: [ values at: index ]
		ifFalse: [ nil ]