X.680 grammar
setType
	^ super setType ==> [:nodes|
		ASN1SetNode new elements: nodes ]