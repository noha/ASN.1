visiting
visitTaggedTypeNode: aNode
	^ ASN1TaggedType new
		module: module;
		type: (self visit: aNode type);
		tag: (self visit: aNode tag);
		tagEnvironment: aNode tagEnvironment