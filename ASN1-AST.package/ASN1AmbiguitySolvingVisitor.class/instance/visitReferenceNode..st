visiting
visitReferenceNode: aReferenceNode
	aReferenceNode type ifNotNil: [
		self visit: aReferenceNode type].
	^ aReferenceNode