X.680 grammar
durationType
	^ super durationType ==> [:node|
		ASN1PrimitiveNode name: node ]