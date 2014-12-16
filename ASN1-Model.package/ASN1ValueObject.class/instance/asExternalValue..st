converting
asExternalValue: anOid
	^ ASN1AdaptiveTypeExternal new
		oid: anOid;
		value: self