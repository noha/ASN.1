visiting
visitImportNode: anImport
	| importModule |
	importModule := root moduleWithIdentifier: anImport module.
	anImport module name propertyAt: #definition put: importModule.
	anImport symbols do: [:each|
		each propertyAt: #definition put: (importModule localNames at: each label) ]