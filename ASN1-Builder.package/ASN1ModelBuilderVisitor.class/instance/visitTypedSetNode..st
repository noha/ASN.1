visiting
visitTypedSetNode: aNode
	^ ASN1TypedSetType new
		type: (self visit: aNode type);
		module: module