visiting
visitComponentTypeNode: aComponentTypeNode 
	aComponentTypeNode type type: (self visit: aComponentTypeNode type type).
	aComponentTypeNode modifiers: (self visit: aComponentTypeNode modifiers).
	^ aComponentTypeNode 