visiting
visitSetNode: aNode
	| node |
	node := aNode normalized.
	^ ASN1SetType new
		elements: (self visitAll: node elements);
		module: module