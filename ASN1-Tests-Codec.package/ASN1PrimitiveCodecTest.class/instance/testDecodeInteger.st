tests
testDecodeInteger
	self assert: (ASN1PrimitiveCodec decodeBitString: { 00 . 16r1. 16r2}) = '0000000100000010'.
	self assert: (ASN1PrimitiveCodec decodeBitString: { 01 . 16r80}) = '1000000'.
	self assert: (ASN1PrimitiveCodec decodeBitString: { 07 . 16r80}) = '1'