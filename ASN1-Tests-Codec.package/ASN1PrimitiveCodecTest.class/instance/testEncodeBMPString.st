tests
testEncodeBMPString
	self assert: (ASN1BMPStringType encode: 'hallo') = #[0 104 0 97 0 108 0 108 0 111].
