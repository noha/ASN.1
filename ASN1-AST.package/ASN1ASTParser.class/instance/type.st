X.680 grammar
type
	^ super type ==> [:nodes|
		nodes second do: [:each|
			nodes first addConstraint: each ].
		nodes first ]