visiting
visitNamedTypeNode: aNode
	| assoc |
	assoc := Association new
		key: aNode name;
		value: (self visit: aNode type ).
	^ assoc