visiting
visitTypeNode: aNode 
	^ (self visit: aNode)
		tag: (self visit: aNode tag);
		tagEnvironment: aNode modifier;
		definingModule: module