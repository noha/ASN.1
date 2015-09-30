*asn1-tool
read: anEncodedValue usingType: aType inContext: aContext skipErrors: aBoolean
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: nil