X.680 grammar
sequenceValue
	^ super sequenceValue ==> [:nodes|
		ASN1SequenceValueNode new
			elements: nodes  ]