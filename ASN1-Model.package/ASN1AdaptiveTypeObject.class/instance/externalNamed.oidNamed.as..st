accessing
externalNamed: aString oidNamed: oidName as: aClass
	^ (aClass type: (type bindingNamed: aString) value parent: self)
		oid: (type bindingNamed: oidName)