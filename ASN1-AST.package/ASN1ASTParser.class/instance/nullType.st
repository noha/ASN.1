X.680 grammar
nullType
	^ super nullType ==> [:node|
		ASN1NullTypeNode new ]