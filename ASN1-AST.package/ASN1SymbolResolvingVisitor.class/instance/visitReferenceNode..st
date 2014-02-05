visiting
visitReferenceNode: aReferenceNode
	super visitReferenceNode: aReferenceNode.
	self resolveReference: aReferenceNode