*asn1-tool
read: anEncodedValue usingType: aType as: aClass
	^ self 
		read: anEncodedValue 
		usingType: aType
		inContext: nil
		as: aClass