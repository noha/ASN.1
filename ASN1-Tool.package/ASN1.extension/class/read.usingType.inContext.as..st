*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext as: aClass
	^self 
		read: aTaggedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: false 
		as: aClass