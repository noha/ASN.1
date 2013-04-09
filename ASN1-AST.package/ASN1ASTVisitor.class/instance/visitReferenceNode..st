visiting
visitReferenceNode: aReferenceNode
	aReferenceNode hasParameters ifTrue: [
		self visitAll: aReferenceNode parameters ].
	aReferenceNode type ifNotNil: [
		self visit: aReferenceNode type].
	^ aReferenceNode