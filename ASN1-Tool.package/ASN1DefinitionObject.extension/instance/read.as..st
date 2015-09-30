*asn1-tool
read: anEncodedValue as: aClass
	^ ASN1 
		read: anEncodedValue
		usingType:  self
		inContext: self modelRoot
		as: aClass