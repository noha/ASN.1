X.683 grammar
parameterizedValue
	^ super parameterizedValue ==> [:nodes|
		nodes first parameters: nodes second]