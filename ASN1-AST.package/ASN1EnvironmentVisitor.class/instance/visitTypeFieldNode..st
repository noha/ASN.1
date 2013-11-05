visiting
visitTypeFieldNode: aTypeFieldNode
	self visit: aTypeFieldNode type.
	self 
		pushScope:  aTypeFieldNode type definition
		during: [self visitAll: aTypeFieldNode fields ] 