X.680 grammar
optionalGroup
	^ super optionalGroup ==> [:nodes| 
		ASN1ValueCollectionNode new
			elements: nodes;
			addModifier: ASN1ModifierOptionalNode new] 