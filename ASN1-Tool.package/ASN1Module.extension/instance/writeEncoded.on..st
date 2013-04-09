*asn1-tool
writeEncoded: anObject on: aStream
	^ASN1
		writeEncoded: anObject 
		on: aStream 
		usingType: self pdu