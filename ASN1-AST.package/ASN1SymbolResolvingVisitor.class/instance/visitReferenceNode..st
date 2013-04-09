visiting
visitReferenceNode: aReferenceNode
	(aReferenceNode label = 'present') ifTrue: [ self halt ].
	super visitReferenceNode: aReferenceNode.
	self resolveReference: aReferenceNode