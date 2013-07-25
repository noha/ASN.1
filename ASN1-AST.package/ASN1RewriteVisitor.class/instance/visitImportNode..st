visiting
visitImportNode: anImport
	anImport moduleIdentifier: (self visit: anImport moduleIdentifier).
	anImport symbols: (self visitAll: anImport symbols).
	^ anImport