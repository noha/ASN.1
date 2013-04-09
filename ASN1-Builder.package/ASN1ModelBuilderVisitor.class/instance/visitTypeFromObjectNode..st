visiting
visitTypeFromObjectNode: aTypeFromObject 
	| object |
	object := aTypeFromObject object dereferenced.
	^ self visit: (aTypeFromObject field inject: object into: [:obj :field| 
		object bindingOf: field label ]) type.
