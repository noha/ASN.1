visiting
visitObjectSetNode: anObjectSetNode
	^ ASN1SetType new
		elements: (self visit: anObjectSetNode elementsSpec);
		module: module
