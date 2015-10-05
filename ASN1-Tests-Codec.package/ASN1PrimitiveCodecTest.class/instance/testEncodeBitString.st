tests
testEncodeBitString
	self assert: (ASN1BitStringType encode: '10') = { 16r7 . 16r80 } asByteArray .
	"test a bit string that is a multiple of 8 if it does not encoe an extra byte"
	self assert: (ASN1BitStringType encode: '00000010') = { 16r1 . 16r2 } asByteArray .
	self assert: (ASN1BitStringType encode: '00100000001') = { 16r5 . 16r20. 16r20 } asByteArray .