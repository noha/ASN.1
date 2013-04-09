visiting
visitReferenceNode: aReferenceNode
	self enterScope: (ASN1Scope new scopeObject: aReferenceNode ).
	super visitReferenceNode: aReferenceNode.
	self leaveScope