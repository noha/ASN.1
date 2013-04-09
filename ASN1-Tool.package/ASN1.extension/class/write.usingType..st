*asn1-tool
write: anObject usingType: aType
	^ ASN1WriteVisitor new
		write: anObject using: aType.