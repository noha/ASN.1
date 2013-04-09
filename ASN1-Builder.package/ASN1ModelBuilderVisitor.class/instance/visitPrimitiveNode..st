visiting
visitPrimitiveNode: aNode
	^ ASN1GenericPrimitive new
		definingModule: module;
		type: aNode name