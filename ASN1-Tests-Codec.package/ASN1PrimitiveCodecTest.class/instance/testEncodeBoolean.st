tests
testEncodeBoolean
	self assert: (ASN1BooleanType encode: true) = #[16rFF].
	self assert: (ASN1BooleanType encode: false) = #[16r0].