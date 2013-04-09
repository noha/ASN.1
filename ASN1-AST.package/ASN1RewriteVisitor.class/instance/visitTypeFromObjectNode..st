visiting
visitTypeFromObjectNode: aTypeFromObject 
	aTypeFromObject object: (self visit: aTypeFromObject object).
	^ aTypeFromObject 