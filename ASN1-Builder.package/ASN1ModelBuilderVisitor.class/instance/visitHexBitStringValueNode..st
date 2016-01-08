visiting
visitHexBitStringValueNode: aBitStringValueNode 

	^ ASN1HexBitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		contents: aBitStringValueNode value;
		module: module