*asn1-tool
read: aTaggedValue usingType: aType
	^ ASN1ReadVisitor new
		read: aTaggedValue using: aType.