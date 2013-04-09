X.683 grammar
parameterizedValueSetType
	^ super parameterizedValueSetType ==> [:nodes|
		nodes first parameters: nodes second]