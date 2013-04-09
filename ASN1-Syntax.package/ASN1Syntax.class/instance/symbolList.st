X.680 grammar
symbolList
	"spec:
		SymbolList ::=
   			Symbol |
   			SymbolList ',' Symbol"
	^ (symbol separatedBy: $, asParser trim) withoutSeparators 