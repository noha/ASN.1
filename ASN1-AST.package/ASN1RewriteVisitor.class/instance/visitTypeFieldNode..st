visiting
visitTypeFieldNode: aTypeFieldNode 
	aTypeFieldNode type: (self visit: aTypeFieldNode type).
	aTypeFieldNode fields: (self visitAll: aTypeFieldNode fields).
	^ aTypeFieldNode 