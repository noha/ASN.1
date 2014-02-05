visiting
visitModuleDefinitionNode: aModuleDefinition
	module := aModuleDefinition.
	^ self 
		provideType: aModuleDefinition  
		during: [ super visitModuleDefinitionNode: aModuleDefinition  ]