visiting
visitTaggedTypeNode: aNode
	^ ASN1TaggedType new
		definingModule: module;
		type: (self visit: aNode type);
		tag: (self visit: aNode tag);
		tagEnvironment: aNode modifier