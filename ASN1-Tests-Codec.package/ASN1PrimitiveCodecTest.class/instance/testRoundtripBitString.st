tests
testRoundtripBitString
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '0000000100000010')) equals: '0000000100000010' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1000000')) equals: '1000000' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1')) equals: '1' 