*asn1-tool
read: anEncodedValue usingType: aType inContext: aContext as: aClass
	^self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: false 
		as: aClass