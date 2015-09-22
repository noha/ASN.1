*asn1-tool
read: anEncodedValue usingType: aType
	^ self 
		read: anEncodedValue 
		usingType: aType
		inContext: nil