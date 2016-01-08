visiting
visitBinaryBitStringValueNode: aBitStringValueNode 

	^ ASN1BinaryBitStringValue new
		type: (self visit: aBitStringValueNode type) value;
		contents: aBitStringValueNode value;
		module: module