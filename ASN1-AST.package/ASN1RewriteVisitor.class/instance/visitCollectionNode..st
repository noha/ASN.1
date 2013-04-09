visiting
visitCollectionNode: aCollection 
	^ aCollection elements: (self visitAll: aCollection elements)