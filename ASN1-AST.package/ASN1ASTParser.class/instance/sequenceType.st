X.680 grammar
sequenceType
	^ super sequenceType ==> [:nodes|
		ASN1SequenceNode new elements: nodes ]