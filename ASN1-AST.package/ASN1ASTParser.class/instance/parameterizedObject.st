X.683 grammar
parameterizedObject
	^ super parameterizedObject ==> [:nodes|
		nodes first parameters: nodes second]