X.681 grammar
literal
	^ super literal ==> [:nodes| 
		ASN1Literal new string: nodes ]