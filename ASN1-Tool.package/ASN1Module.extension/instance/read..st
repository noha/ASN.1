*asn1-tool
read: anEncodedObject
	^ ASN1
		read: anEncodedObject 
		usingType:  self pdu