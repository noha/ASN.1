X.680 grammar
enumeratedType
	^super enumeratedType ==> [:nodes|
		ASN1EnumeratedNode new elements: nodes ]