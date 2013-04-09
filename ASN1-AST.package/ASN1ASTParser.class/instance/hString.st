X.681 grammar
hString
	^ super hString ==> [:nodes|
		ASN1PrimitiveValueNode new
			type: (ASN1PrimitiveNode name: 'hstring');
			value: nodes ]