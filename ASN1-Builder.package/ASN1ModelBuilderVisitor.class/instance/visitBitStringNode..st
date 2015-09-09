visiting
visitBitStringNode: aBitString 
	^ ASN1BitStringType new
		bits: (self visitAll: aBitString bits);
		module: module