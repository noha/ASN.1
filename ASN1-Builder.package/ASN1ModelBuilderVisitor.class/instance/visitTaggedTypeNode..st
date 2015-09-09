visiting
visitTaggedTypeNode: aNode
	^ ASN1TaggedType new
		module: (module ifNil: [self halt]);
		type: (self visit: aNode type);
		tag: (self visit: aNode tag);
		tagEnvironment: aNode tagEnvironment