*asn1-tool
encodedValue: anObject
	^ ASN1PrimitiveTaggedValue new 
		contents: (self class encode: anObject);
		tag: self universalTag		