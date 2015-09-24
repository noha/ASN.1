visiting
visitObjectIdentifierNode: anObjectId
	^ (ASN1ObjectIdentifier contents: anObjectId oidString)
		module: module