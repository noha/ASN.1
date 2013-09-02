*asn1-tool
read: aTaggedValue usingType: aType
	^ self 
		read: aTaggedValue 
		usingType: aType
		inContext: nil