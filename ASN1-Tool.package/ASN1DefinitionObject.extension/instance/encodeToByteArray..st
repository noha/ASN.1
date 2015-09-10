*asn1-tool
encodeToByteArray: anEncodedObject
	^ ASN1 
		encodeToByteArray: anEncodedObject 
		usingType: self