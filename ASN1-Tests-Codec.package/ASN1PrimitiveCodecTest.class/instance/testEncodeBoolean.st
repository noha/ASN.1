tests
testEncodeBoolean
	self assert: (ASN1GenericPrimitiveType encodeBoolean: true) = #[16rFF].
	self assert: (ASN1GenericPrimitiveType encodeBoolean: false) = #[16r0].