visiting
visitReferenceNode: aReferenceNode
	self 
		pushScope: aReferenceNode 
		during: [ super visitReferenceNode: aReferenceNode ]