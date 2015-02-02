tests
testDecodeBMPString
	self assert: (ASN1BMPStringType decode: #[0 104 0 97 0 108 0 108 0 111])  = 'hallo'