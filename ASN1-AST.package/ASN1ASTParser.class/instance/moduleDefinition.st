X.680 grammar
moduleDefinition
	^ super moduleDefinition ==> [:nodes| 
		ASN1ModuleDefinitionNode new
			identifier: nodes first;
			encodingReferenceDefault: nodes second;
			tagDefault: nodes third;
			extensionDefault: nodes fourth;
			exports: nodes fifth first;
			imports: nodes fifth second;
			assignments: nodes fifth third;
			encodingControlSections: nodes sixth ]