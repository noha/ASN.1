X.680 grammar
namedBitList
	"Spec:
		NamedBitList ::= 
			NamedBit |
			NamedBitList ',' NamedBit"
	^ (namedBit separatedBy: $, asParser trim) withoutSeparators 