X.680 grammar
typeWithConstraint
	^ super typeWithConstraint ==> [:nodes| | collection |
		collection := (nodes first = 'SET')
			ifTrue: [ ASN1TypedSetNode new ]
			ifFalse: [ ASN1TypedSequenceNode new ].
		collection addConstraint: nodes second.
		collection type: nodes fourth.
		]