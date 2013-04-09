visiting
visitCollectionNode: aCollection
	self visitAll: aCollection elements.
	^ self visitTypeNode: aCollection