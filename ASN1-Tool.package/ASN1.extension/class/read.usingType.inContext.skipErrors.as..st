*asn1-tool
read: anEncodedValue usingType: aType inContext: aContext skipErrors: aBoolean as: aClass
	^ self 
		read: anEncodedValue 
		usingType: aType 
		inContext: aContext 
		skipErrors: aBoolean 
		as: aClass 
		reader: self readVisitorClass new
			