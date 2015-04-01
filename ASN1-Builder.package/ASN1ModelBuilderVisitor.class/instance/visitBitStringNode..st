visiting
visitBitStringNode: aBitString 
	^ ASN1BitStringType new
		bits: (self visitAll: aBitString bits);
		definingModule: module