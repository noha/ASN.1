converting
asExternalMap: anOid
	^ ASN1AdaptiveTypeExternal new
		oid: anOid;
		setMap: map