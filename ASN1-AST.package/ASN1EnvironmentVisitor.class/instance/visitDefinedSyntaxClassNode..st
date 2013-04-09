visiting
visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode 
	self enterScope: (ASN1Scope new scopeObject: aDefinedSyntaxClassNode).
	super visitDefinedSyntaxClassNode: aDefinedSyntaxClassNode.
	self leaveScope.