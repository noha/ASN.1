visiting
visitElementsNode: anElements 
	self visit: anElements entity.
	anElements exclusions ifNotNil: [
		self visitAll: anElements exclusions ].
	^ anElements