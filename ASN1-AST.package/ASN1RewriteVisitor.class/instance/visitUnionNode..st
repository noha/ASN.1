visiting
visitUnionNode: aUnion
	aUnion elements: (self visitAll: aUnion elements).
	^ aUnion