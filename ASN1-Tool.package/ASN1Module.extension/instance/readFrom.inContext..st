*asn1-tool
readFrom: aStream inContext: aContext
	^ ASN1
		readFrom: aStream
		usingType:  self pdu
		inContext: aContext