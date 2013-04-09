X.680 grammar
setOfType
	^ super setOfType ==> [:nodes| 
		ASN1TypedSetNode new
			type: nodes  ]