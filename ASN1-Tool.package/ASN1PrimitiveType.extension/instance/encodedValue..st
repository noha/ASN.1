*asn1-tool
encodedValue: anObject
	^ ASN1EncodedPrimitiveValue new 
		contents: (self class encode: anObject);
		tag: self universalTag		