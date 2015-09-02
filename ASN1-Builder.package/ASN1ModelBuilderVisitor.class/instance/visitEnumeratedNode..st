visiting
visitEnumeratedNode: aNode
	^ ASN1EnumeratedType new
		elements: (self visitAll: aNode elements);
		definingModule: module;
		sanitizeValues