visiting
visitBitStringNode: aBitString 
	^ ASN1BitString new
		bits: (self visitAll: aBitString bits)