*asn1-tool
readEncodedFrom: aStream
	^ ASN1
		readEncodedFrom: aStream
		usingType:  self pdu