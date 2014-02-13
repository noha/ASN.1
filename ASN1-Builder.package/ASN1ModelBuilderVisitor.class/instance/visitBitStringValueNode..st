visiting
visitBitStringValueNode: aBitStringValueNode 
	^ ASN1BitStringValue new
		type: (self visit: aBitStringValueNode type);
		bits: aBitStringValueNode value