visiting
visitComponentTypeNode: aComponentTypeNode
	"assign the type of the node to its default value if there is any. Convert
	the component type to a association holding key and value of the 
	component type"
	| type |
	(aComponentTypeNode modifiers notNil and: [ aComponentTypeNode modifiers isDefaultValue ]) ifTrue: [ 
		aComponentTypeNode modifiers type: aComponentTypeNode basicType ].
	type := (self visit: aComponentTypeNode type). 
	^ Association new
		key: type key;
		value: (ASN1ComponentType new
			module: module;
			type: type value;
			modifier:  (self visit: aComponentTypeNode modifiers);
			yourself)