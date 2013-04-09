X.680 grammar
symbolsFromModule
	"spec:
		SymbolsFromModule ::=
   			SymbolList FROM GlobalModuleReference"
	^ symbolList, 'FROM' asParser asn1Token, globalModuleReference 
		==> [:nodes| Array with: nodes first with: nodes third]