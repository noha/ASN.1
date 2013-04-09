visiting
visitImportNode: anImport
	self visit: anImport module.
	self visitAll: anImport symbols.
	^ anImport