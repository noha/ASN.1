visiting
visitModuleDefinitionNode: aModule
	self enterScope: (ASN1Scope new scopeObject: aModule).
	super visitModuleDefinitionNode: aModule.
	self leaveScope.