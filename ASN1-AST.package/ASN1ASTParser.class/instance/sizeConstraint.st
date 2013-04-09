X.682 grammar
sizeConstraint 
	^ super sizeConstraint ==> [:nodes|
		ASN1ConstraintNode new
			constraint: nodes ]