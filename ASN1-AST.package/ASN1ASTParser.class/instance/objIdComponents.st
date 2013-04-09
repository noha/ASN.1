X.680 grammar
objIdComponents
	^ super objIdComponents ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]