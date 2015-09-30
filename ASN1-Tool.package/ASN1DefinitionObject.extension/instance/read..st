*asn1-tool
read: anEncodedValue
	^ ASN1 
		read: anEncodedValue
		usingType:  self