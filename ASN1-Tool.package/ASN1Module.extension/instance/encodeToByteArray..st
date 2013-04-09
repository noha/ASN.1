*asn1-tool
encodeToByteArray: anObject
	^ ASN1 
		encodeToByteArray: anObject 
		usingType: self pdu