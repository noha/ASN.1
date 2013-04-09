visiting
visitTypedCollectionNode: aNode
	self visit: aNode type.
	^ self visitNode: aNode 