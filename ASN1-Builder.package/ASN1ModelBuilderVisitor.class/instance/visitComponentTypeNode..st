visiting
visitComponentTypeNode: aComponentTypeNode
	| type |
	type := self visit: aComponentTypeNode type.
	^ ASN1Association new
		key: type key;
		value: (ASN1ComponentType new
			definingModule: module;
			type: type value;
			modifier:  (self visit: aComponentTypeNode modifiers);
			yourself)