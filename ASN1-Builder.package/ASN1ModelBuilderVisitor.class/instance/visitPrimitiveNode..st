visiting
visitPrimitiveNode: aNode
	^ ASN1GenericPrimitiveType new
		definingModule: module;
		type: aNode name