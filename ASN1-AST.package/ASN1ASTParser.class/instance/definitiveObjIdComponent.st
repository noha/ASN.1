X.680 grammar
definitiveObjIdComponent
	^ super definitiveObjIdComponent ==> [:nodes| 
		ASN1ObjectIdComponentNode nodes: nodes ]