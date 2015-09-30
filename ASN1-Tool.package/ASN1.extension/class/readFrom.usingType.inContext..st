*asn1-tool
readFrom: aStream usingType: aType inContext: aContext
	^ self 
		read: (self readEncodedValuesFrom: aStream)
		usingType: aType
		inContext: aContext