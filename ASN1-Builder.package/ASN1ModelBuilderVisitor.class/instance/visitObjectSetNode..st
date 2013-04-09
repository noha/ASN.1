visiting
visitObjectSetNode: anObjectSetNode
	^ ASN1Set new
		elements: (self visit: anObjectSetNode elementsSpec)
