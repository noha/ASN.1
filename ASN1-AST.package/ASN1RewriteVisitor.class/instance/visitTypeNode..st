visiting
visitTypeNode: aTypeNode
	^ aTypeNode constraints: (self visitAll: aTypeNode constraints)
