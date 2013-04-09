X.680 grammar
globalModuleReference
	^ super globalModuleReference ==> [:nodes|
		ASN1ModuleIdentifierNode new
			name: nodes first;
			oid: nodes second ]