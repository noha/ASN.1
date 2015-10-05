tests
testRoundtripBitString
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '0000000100000010')) = '000000010000001' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1000000')) = '1' .
	self assert: (ASN1BitStringType decode: (ASN1BitStringType encode: '1')) = '1' 