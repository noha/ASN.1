*asn1-tool
readFrom: aStream usingType: aType 
	^ self 
		read: (self readTaggedValuesFrom: aStream)
		usingType: aType
