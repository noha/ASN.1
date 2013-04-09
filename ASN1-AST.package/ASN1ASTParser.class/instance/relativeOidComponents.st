X.680 grammar
relativeOidComponents
	^ super relativeOidComponents ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]