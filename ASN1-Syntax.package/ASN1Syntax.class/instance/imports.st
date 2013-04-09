X.680 grammar
imports
	"spec: 
		Imports ::=
   			IMPORTS SymbolsImported ';' |
   			empty"
	"spec:
		SymbolsImported ::=
   			SymbolsFromModuleList |
   			empty"
	"spec:
		SymbolsFromModuleList ::=
   			SymbolsFromModule |
   			SymbolsFromModuleList SymbolsFromModule"
	^ ('IMPORTS' asParser asn1Token ,  
		 symbolsFromModule trim star, 
		$; asParser asn1Token) optional ==> [:nodes| nodes ifNotNil: [ nodes second ]]