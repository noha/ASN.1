visiting
visitElementsNode: anElements
	anElements entity: (self visit: anElements entity).
	anElements exclusions: (self visitAll: anElements exclusions).
	^ anElements