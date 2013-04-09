*asn1-tool
write: anObject
	^ ASN1
		write: anObject  
		usingType:  self pdu