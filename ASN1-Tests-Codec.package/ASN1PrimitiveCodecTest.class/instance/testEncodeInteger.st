tests
testEncodeInteger
	self assert: (ASN1IntegerType encode:  0) = { 16r0 } asByteArray .
	self assert: (ASN1IntegerType encode:  -1) = { 16rff } asByteArray .
	self assert: (ASN1IntegerType encode:  -128) = { 16r80 } asByteArray .
	self assert: (ASN1IntegerType encode:  1) = { 16r01 } asByteArray .
	self assert: (ASN1IntegerType encode:  127) = { 16r7f } asByteArray .
	self assert: (ASN1IntegerType encode:  -32768) = { 16r00 . 16r80 } asByteArray .
	self assert: (ASN1IntegerType encode:  32767) = { 16rff . 16r7f } asByteArray .
	self rountTrip: #Integer value: 0.
