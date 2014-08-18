tests
testDecodeBitString
	self assert: (ASN1BitStringType  decode: { 00 . 16r1. 16r2}) = '0000000100000010'.
	self assert: (ASN1BitStringType decode: { 01 . 16r80}) = '1000000'.
	self assert: (ASN1BitStringType decode: { 07 . 16r80}) = '1'.
	self assert: (ASN1BitStringType decode: { 0 }) = ''