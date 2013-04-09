visiting
visitModuleDefinitionNode: aModuleDefinition
	self flag: #incomplete.
	aModuleDefinition identifier: (self visit: aModuleDefinition identifier).
	aModuleDefinition exports: (self visitAll: aModuleDefinition exports).
	aModuleDefinition imports: (self visitAll: aModuleDefinition imports).
	aModuleDefinition assignments: (self visitAll: aModuleDefinition assignments).
	^ aModuleDefinition 