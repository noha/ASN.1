visiting
visitBitStringValueNode: aBitStringValueNode 
	^ ASN1BitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		bits: aBitStringValueNode value;
		module: module