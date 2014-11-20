*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext
	^ self 
		read: aTaggedValue 
		usingType: aType 
		inContext: aContext 
		as: nil