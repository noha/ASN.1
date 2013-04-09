resolving
resolveAllSymbols
	"annotate all names in the grammar with their definition"	
	self accept: (ASN1SymbolResolvingVisitor new root: self)