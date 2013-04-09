visiting
visitObjectIdentifierNode: anObjectId
	anObjectId components: (self visitAll: anObjectId components).
	^ anObjectId