*asn1-tool
read: aTaggedValue inContext: aContext
	^ ASN1
		read: aTaggedValue
		usingType:  self pdu
		inContext: aContext