*asn1-tool
read: anEncodedValue usingType: aType inContext: aContext
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		as: nil