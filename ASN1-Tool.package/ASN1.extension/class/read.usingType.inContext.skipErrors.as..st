*asn1-tool
read: aTaggedValue usingType: aType inContext: aContext skipErrors: aBoolean as: aClass
	^ self 
		read: aTaggedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: aClass 
		reader: self readVisitorClass new
			