X.680 grammar
namedValue
	^ super namedValue ==> [:nodes| 
		ASN1NamedValueNode new
			name: nodes first; 
			value: nodes second]