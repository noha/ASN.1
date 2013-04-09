visiting
visitSequenceNode: aNode
	| node |
	node := aNode normalized.
	^ ASN1Sequence new
		elements: (self visitAll: node elements)