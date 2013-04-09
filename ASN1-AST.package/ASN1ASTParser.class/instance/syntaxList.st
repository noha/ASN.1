X.681 grammar
syntaxList 
	^ super syntaxList ==> [:nodes|
		ASN1ValueCollectionNode new
			elements: nodes ] 