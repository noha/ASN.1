as yet unclassified
allModuleNames
	^ (path allFiles copyWithout: (path / self manifestFilename))
		collect: #basenameWithoutExtension