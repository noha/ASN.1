visiting
visitModuleDefinitionNode: aModuleDefinition
	| previousModule |
	previousModule := module.
	module := aModuleDefinition.
	^ [ super visitModuleDefinitionNode: aModuleDefinition  ]
		ensure: [ module := previousModule  ]