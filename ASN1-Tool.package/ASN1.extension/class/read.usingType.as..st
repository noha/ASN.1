*asn1-tool
read: aTaggedValue usingType: aType as: aClass
	^ self 
		read: aTaggedValue 
		usingType: aType
		inContext: nil
		as: aClass