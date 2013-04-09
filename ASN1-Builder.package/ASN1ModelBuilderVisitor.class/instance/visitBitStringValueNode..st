visiting
visitBitStringValueNode: aBitStringValueNode 
	^ ASN1PrimitiveValue new
		type: 'bit string';
		value: aBitStringValueNode value