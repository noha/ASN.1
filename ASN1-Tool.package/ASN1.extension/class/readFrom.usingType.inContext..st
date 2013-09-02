*asn1-tool
readFrom: aStream usingType: aType inContext: aContext
	^ self 
		read: (self readTaggedValuesFrom: aStream)
		usingType: aType
		inContext: aContext