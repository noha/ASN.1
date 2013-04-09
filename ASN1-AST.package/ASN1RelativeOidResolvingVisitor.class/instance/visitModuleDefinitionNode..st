visiting
visitModuleDefinitionNode: aModuleDefinition
	module := aModuleDefinition.
	[ ^ super visitModuleDefinitionNode: aModuleDefinition ]
		ensure: [ module := nil ]