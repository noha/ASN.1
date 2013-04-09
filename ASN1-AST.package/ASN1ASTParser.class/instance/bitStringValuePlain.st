X.680 grammar
bitStringValuePlain
	^ super bitStringValue ==> [:nodes|
		ASN1BitStringValueNode new
			value: nodes ]