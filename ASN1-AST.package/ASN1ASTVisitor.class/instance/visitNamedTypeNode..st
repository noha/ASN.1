visiting
visitNamedTypeNode: aNamedType 
	self visit: aNamedType type.
	^ aNamedType 