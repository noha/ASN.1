*asn1-tool
read: aTaggedValue as: aClass
	^ ASN1 
		read: aTaggedValue
		usingType:  self
		inContext: self modelRoot
		as: aClass