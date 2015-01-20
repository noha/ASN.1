accessing
externalNamed: aString oidNamed: oidName as: aClass
	^ (aClass type: (self asn1TypeNamed: aString) parent: self)
		oid: (self asn1TypeNamed: oidName)