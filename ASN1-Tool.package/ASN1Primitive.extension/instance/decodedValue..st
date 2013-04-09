*asn1-tool
decodedValue: anObject
	^ ASN1PrimitiveCodec 
		perform: self selectorForDecoding
		with: anObject