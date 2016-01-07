visiting
visitBitStringNode: aBitString 
	^ ASN1BitStringType new
		namedBits: (self visitAll: aBitString bits);
		module: module