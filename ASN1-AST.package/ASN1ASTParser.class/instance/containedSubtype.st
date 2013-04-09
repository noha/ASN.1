X.680 grammar
containedSubtype
	^ super containedSubtype ==> [:nodes| 
		ASN1ConstraintNode new
			constraint: nodes ]