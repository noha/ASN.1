X.683 grammar
parameterizedObjectSet
	^ super parameterizedObjectSet ==> [:nodes|
		nodes first parameters: nodes second]