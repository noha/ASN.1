X.680 grammar
relativeOidValue
	^ super relativeOidValue ==> [:nodes| 
		ASN1ObjectIdNode components: nodes ]