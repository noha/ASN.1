visiting
visitPrimitiveValueNode: aPrimitiveValueNode 
	^ ASN1PrimitiveValue new
		type: aPrimitiveValueNode type;
		value: aPrimitiveValueNode value