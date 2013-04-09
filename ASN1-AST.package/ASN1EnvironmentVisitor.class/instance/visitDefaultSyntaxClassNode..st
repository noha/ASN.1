visiting
visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode 
	self enterScope: (ASN1Scope new scopeObject: aDefaultSyntaxClassNode).
	super visitDefaultSyntaxClassNode: aDefaultSyntaxClassNode.
	self leaveScope.