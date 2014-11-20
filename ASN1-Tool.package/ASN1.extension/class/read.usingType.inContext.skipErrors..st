*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext skipErrors: aBoolean
	^ self 
		read: aTaggedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: nil