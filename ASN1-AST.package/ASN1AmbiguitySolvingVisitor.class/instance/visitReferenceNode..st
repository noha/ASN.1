visiting
visitReferenceNode: aReferenceNode
	aReferenceNode type ifNotNil: [
		self visit: aReferenceNode type].
	(aReferenceNode definition notNil and: [ aReferenceNode definition class = ASN1AmbiguousNode ]) ifTrue: [ 
		aReferenceNode definition: (self visit: aReferenceNode definition)  ].
	^ aReferenceNode