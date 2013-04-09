visiting
visitObjectSetNode: anObjectSetNode
	^ anObjectSetNode elementsSpec: (self visit: anObjectSetNode elementsSpec)
