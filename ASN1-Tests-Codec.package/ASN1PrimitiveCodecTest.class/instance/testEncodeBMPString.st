tests
testEncodeBMPString
	self assert: (ASN1BMPStringType encode: 'hallo') = #[0 104 0 97 0 108 0 108 0 111].
	self assert: (ASN1BMPStringType encode: ('ascii ', (Character value: 16r14B) asString)) = #[0 97 0 115 0 99 0 105 0 105 0 32 1 75].
	

