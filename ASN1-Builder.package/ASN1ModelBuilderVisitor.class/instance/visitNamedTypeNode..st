visiting
visitNamedTypeNode: aNode
	| assoc |
	assoc := ASN1Association new
		key: aNode name;
		value: (self visit: aNode type ).
	^ assoc