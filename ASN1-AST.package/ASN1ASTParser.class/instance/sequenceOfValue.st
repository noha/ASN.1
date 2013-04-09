X.680 grammar
sequenceOfValue 	
	^ super sequenceOfValue ==> [:nodes| 
			ASN1SequenceOfValueNode new
				elements: nodes ]