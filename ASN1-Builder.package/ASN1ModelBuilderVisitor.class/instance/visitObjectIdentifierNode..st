visiting
visitObjectIdentifierNode: anObjectId
	^ (ASN1ObjectIdentifier value: anObjectId oidString)
		module: module