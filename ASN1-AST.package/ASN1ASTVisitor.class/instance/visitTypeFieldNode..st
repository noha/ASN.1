visiting
visitTypeFieldNode: aTypeFieldNode 
	self visit: aTypeFieldNode type.
	self visitAll: aTypeFieldNode fields.
	^ aTypeFieldNode 