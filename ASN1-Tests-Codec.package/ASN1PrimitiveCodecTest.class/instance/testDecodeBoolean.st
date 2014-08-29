tests
testDecodeBoolean
	self assert: (ASN1BooleanType decode: #[16rFF]) = true.
	self assert: (ASN1BooleanType decode: #[16r23]) = true.
	self assert: (ASN1BooleanType decode: #[16r00]) = false.