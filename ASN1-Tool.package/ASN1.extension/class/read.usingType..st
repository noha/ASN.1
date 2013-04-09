*asn1-tool
read: anEncodedObject usingType: aType
	^ ASN1ReadVisitor new
		read: anEncodedObject using: aType.