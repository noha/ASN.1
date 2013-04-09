resolving
resolveImportSymbols
	"annotate all imported modules and names with their definitions"
	self accept: (ASN1ImportSymbolVisitor new root: self)