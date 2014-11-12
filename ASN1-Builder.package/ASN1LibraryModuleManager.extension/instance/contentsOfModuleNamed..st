as yet unclassified
contentsOfModuleNamed: aString
	| selector |
	selector := library selectorNameFrom: aString.
	^ library perform: selector asSymbol 