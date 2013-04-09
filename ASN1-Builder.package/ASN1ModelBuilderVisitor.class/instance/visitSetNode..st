visiting
visitSetNode: aNode
	| node |
	node := aNode normalized.
	^ ASN1Set new
		elements: (self visitAll: node elements)