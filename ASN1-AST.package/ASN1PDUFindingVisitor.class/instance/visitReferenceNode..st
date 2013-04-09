visiting
visitReferenceNode: aNode
	candidates removeKey: aNode definition ifAbsent: [].
	super visitReferenceNode: aNode.
