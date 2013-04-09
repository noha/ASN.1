X.680 grammar
moduleIdentifier
	^ super moduleIdentifier ==> [:nodes| ASN1ModuleIdentifierNode nodes: nodes. ]