tests
testDecodeBoolean
	self assert: (ASN1PrimitiveCodec decodeBoolean: #[16rFF]) = true.
	self assert: (ASN1PrimitiveCodec decodeBoolean: #[16r00]) = false.