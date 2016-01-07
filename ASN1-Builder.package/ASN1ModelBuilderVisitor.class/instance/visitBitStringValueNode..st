visiting
visitBitStringValueNode: aBitStringValueNode 
	^ ASN1BitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		namedBits: aBitStringValueNode value;
		module: module