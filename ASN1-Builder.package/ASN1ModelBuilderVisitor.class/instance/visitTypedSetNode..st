visiting
visitTypedSetNode: aNode
	^ ASN1TypedSet new
		type: (self visit: aNode type)