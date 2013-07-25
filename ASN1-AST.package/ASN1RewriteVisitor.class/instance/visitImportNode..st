visiting
visitImportNode: anImport
	anImport moduleIdentifier: (self visit: anImport module).
	anImport symbols: (self visitAll: anImport symbols).
	^ anImport