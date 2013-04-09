X.680 grammar
externalType
	^ super externalType ==> [:nodes|
		ASN1ExternalTypeNode new ]