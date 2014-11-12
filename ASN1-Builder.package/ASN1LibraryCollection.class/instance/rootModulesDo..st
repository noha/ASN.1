as yet unclassified
rootModulesDo: aBlock

	self sortedLibraries do: [ :library |
		library rootModuleNames do: [ :moduleName | 
			aBlock value: (library moduleNamed: moduleName ) ] ]