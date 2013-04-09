X.680 grammar
namedType
	^ super namedType ==> [:nodes| 
		ASN1NamedTypeNode new
			name: nodes first;
			type: nodes second ]