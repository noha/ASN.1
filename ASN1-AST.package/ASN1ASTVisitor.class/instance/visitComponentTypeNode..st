visiting
visitComponentTypeNode: aComponentTypeNode 
	self visit: aComponentTypeNode type.
	self visit: aComponentTypeNode modifiers.
	^ aComponentTypeNode 