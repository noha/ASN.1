tests
testEncodeBoolean
	self assert: (ASN1PrimitiveCodec encodeBoolean: true) = #[16rFF].
	self assert: (ASN1PrimitiveCodec encodeBoolean: false) = #[16r0].