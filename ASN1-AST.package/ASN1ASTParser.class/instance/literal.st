X.681 grammar
literal
	^ super literal ==> [:nodes| 
		ASN1LiteralNode new string: nodes ]