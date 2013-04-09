visiting
visitUnionNode: aNode
	^ ASN1Union new
		elements: (self visitAll: aNode elements )