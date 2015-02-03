X.680 grammar
bitStringType
	^ super bitStringType ==> [:nodes| | bitString |
		bitString := ASN1BitStringTypeNode new.
		nodes second notNil ifTrue: [
			bitString bits: nodes second second ].
		bitString ]