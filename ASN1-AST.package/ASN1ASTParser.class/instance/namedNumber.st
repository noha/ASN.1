X.680 grammar
namedNumber
	^ super namedNumber ==> [:nodes| 
			ASN1NamedNumberNode 
				name: nodes first
				number: nodes second ]