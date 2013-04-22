*asn1-tool
readFrom: aStream
	^ ASN1
		readFrom: aStream
		usingType:  self pdu