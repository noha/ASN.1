X.680 grammar
unions
	^ super unions ==> [:nodes|
		ASN1UnionNode new
			elements: nodes]