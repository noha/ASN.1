visiting
visitImportNode: anImport
	anImport module: (self visit: anImport module).
	anImport symbols: (self visitAll: anImport symbols).
	^ anImport