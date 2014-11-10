*asn1-tool
write: anObject usingType: aType
	^ self writeVisitorClass new
		write: anObject using: aType.