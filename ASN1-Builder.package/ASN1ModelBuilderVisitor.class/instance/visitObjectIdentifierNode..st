visiting
visitObjectIdentifierNode: anObjectId
	^ (ASN1Oid value: anObjectId oidString)
		definingModule: module