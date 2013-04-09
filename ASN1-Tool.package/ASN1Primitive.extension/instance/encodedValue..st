*asn1-tool
encodedValue: anObject
	^ ASN1PrimitiveEncoding new 
		contents: (ASN1PrimitiveCodec 
			perform: self selectorForEncoding 
			with: anObject);
		tag: self universalTag