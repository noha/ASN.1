accessing
externalNamed: aString oidNamed: oidName
	^ (ASN1AdaptiveTypeExternal type: (self bindingNamed: aString) parent: self)
		oid: (self bindingNamed: oidName)