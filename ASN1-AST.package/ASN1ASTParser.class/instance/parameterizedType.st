X.683 grammar
parameterizedType
	^ super parameterizedType ==> [:nodes|
		nodes first parameters: nodes second ]