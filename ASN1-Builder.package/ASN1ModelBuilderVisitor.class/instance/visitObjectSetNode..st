visiting
visitObjectSetNode: anObjectSetNode
	^ ASN1SetType new
		elements: (self visit: anObjectSetNode elementsSpec);
		definingModule: module
