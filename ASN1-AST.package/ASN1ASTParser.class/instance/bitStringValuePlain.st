X.680 grammar
bitStringValuePlain
	^ super bitStringValue ==> [:nodes|
		"this is an empty bit string value so we assign a type without bits"
		ASN1BitStringValueNode new
			type: ASN1BitStringNode new; 
			value: (nodes ifNil: [ Array new ] ) ]