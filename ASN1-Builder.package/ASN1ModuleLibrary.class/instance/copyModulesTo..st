copying
copyModulesTo: aModuleLibrary
	self allModuleNames do: [ :moduleName |
		aModuleLibrary storeModule: (self moduleNamed: moduleName) named: moduleName ]