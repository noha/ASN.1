copying
copyTo: aModuleLibrary
	self copyModulesTo: aModuleLibrary.
	aModuleLibrary 
		name: self name;
		dependencies: self dependencies;
		rootModules: self rootModules.