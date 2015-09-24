visiting
visitPrimitiveValueNode: aPrimitiveValueNode 
	^ ASN1PrimitiveValue new
		type: aPrimitiveValueNode type;
		contents: aPrimitiveValueNode value;
		module: module