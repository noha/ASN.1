visiting
visitBitStringValueNode: aBitStringValueNode 
	^ ASN1PrimitiveValue new
		type: (self visit: aBitStringValueNode type);
		value: aBitStringValueNode resolvedValue