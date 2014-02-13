tests
testEncodeInteger
	self assert: (ASN1PrimitiveCodec encodeInteger:  0) = { 16r0 } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  -1) = { 16rff } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  -128) = { 16r80 } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  1) = { 16r01 } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  127) = { 16r7f } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  -32768) = { 16r00 . 16r80 } asByteArray .
	self assert: (ASN1PrimitiveCodec encodeInteger:  32767) = { 16rff . 16r7f } asByteArray .
	self rountTrip: #Integer value: 0.
