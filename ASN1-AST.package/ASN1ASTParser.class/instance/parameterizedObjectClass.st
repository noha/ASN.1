X.683 grammar
parameterizedObjectClass
	^ super parameterizedObjectClass ==> [:nodes|
		nodes first parameters: nodes second ]