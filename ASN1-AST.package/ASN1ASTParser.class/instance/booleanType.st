X.680 grammar
booleanType
	^ super booleanType ==> [:node|
		ASN1PrimitiveNode name: node ]