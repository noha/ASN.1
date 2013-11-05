visiting
visitModuleDefinitionNode: aModule
	self 
		pushScope: aModule
		during: [  super visitModuleDefinitionNode: aModule ]