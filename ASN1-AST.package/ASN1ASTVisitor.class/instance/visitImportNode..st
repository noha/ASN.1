visiting
visitImportNode: anImport
	self visit: anImport moduleIdentifier.
	self visitAll: anImport symbols.
	^ anImport