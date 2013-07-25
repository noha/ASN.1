X.680 grammar
symbolsFromModule
	^ super symbolsFromModule ==> [:nodes| 
		ASN1ImportNode new
			symbols: nodes first;
			moduleIdentifier: nodes second ]