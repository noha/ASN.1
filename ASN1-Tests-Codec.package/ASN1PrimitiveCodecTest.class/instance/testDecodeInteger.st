tests
testDecodeInteger
	self assert: (ASN1IntegerType decode:  { 0 . 16r9B }) = 155
	