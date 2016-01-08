visiting
visitPrimitiveValueNode: aPrimitiveValueNode 

	^ ASN1PrimitiveValue new
		type: (self visit: aPrimitiveValueNode type);
		contents: aPrimitiveValueNode value;
		module: module