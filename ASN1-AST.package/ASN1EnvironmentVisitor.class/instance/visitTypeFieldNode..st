visiting
visitTypeFieldNode: aTypeFieldNode
	self visit: aTypeFieldNode type.
	self enterScope: (ASN1Scope new scopeObject: (aTypeFieldNode type definition)).
	self visitAll: aTypeFieldNode fields.
	self leaveScope 