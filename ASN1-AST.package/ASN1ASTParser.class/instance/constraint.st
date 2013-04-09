X.680 grammar
constraint
	^ super constraint ==> [:nodes| 
		ASN1ConstraintNode 
			constraint: nodes first
			exception: nodes second ]