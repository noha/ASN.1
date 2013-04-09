X.680 grammar
exports
	"spec: 
		Exports ::=
   			EXPORTS SymbolsExported ';' |
   			EXPORTS ALL ';' |
   			empty"
	"spec:
		SymbolsExported ::=
   			SymbolList |
   			empty"
	^ ('EXPORTS' asParser trim , 
		(symbolList trim optional / 'ALL' asParser) trim,  $; asParser trim) optional  ==> [:nodes| 
			nodes ifNotNil: [ nodes second ] ]