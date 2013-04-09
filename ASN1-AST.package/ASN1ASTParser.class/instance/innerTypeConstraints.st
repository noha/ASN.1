X.680 grammar
innerTypeConstraints 
	^ super innerTypeConstraints ==> [:nodes|
		ASN1ConstraintNode new
			constraint: nodes ]