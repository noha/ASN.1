visiting
visitReferenceNode: aReferenceNode
	aReferenceNode type ifNotNil: [
		aReferenceNode type: (self visit: aReferenceNode type)].
	aReferenceNode hasParameters ifTrue: [
		aReferenceNode parameters: (self visitAll: aReferenceNode parameters) ].
	^ aReferenceNode