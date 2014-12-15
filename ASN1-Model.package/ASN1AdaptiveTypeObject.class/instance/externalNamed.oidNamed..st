accessing
externalNamed: aString oidNamed: oidName
	^ (ASN1AdaptiveTypeExternal type: (type bindingNamed: aString) parent: self)
		oid: (type bindingNamed: oidName)