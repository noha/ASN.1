visiting
visitNamedTypeNode: aNamedType 
	aNamedType type: (self visit: aNamedType type).
	^ aNamedType 