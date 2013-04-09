visiting
visitModuleDefinitionNode: aModuleDefinition
	self reset.
	self visitAll: aModuleDefinition imports.
	