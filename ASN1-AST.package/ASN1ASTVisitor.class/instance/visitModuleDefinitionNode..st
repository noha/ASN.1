visiting
visitModuleDefinitionNode: aModuleDefinition
	self flag: #incomplete.
	self visit: aModuleDefinition identifier.
	self visitAll: aModuleDefinition exports.
	self visitAll: aModuleDefinition imports.
	self visitAll: aModuleDefinition assignments.
	^ aModuleDefinition 