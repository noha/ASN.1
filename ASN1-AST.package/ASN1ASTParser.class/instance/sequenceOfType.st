X.680 grammar
sequenceOfType
	^ super sequenceOfType ==> [:nodes| 
		ASN1TypedSequenceNode new
			type: nodes  ]