X.680 grammar
symbolsFromModule
	^ super symbolsFromModule ==> [:nodes| 
		ASN1ImportNode new
			symbols: nodes first;
			module: nodes second ]