X.680 grammar
namedBit
	^ super namedBit ==> [:nodes|
		ASN1NamedBitNode new
			name: nodes first;
			value: nodes second ] 