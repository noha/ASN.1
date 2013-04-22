*asn1-tool
write: anObject on: aStream
	^ASN1
		write: anObject 
		on: aStream 
		usingType: self pdu