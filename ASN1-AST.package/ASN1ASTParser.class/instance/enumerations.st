X.680 grammar
enumerations
	^ super enumerations ==> [:nodes|
		"extension and exceptions are ignored at the moment"
		self flag: #needsRedesign.
		nodes first ]