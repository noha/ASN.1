*asn1-tool
readEncodedFrom: aStream usingType: aType 
	^ self 
		read: (self codecStreamClass on: aStream) next
		usingType: aType
