tests
testDecodePrintableString
	self assert: (ASN1PrintableStringType decode: #[104 97 108 108 111])  = 'hallo'.
	self 
		should: [ ASN1PrintableStringType decode: #[104 97 108 108 111 64] ]
		raise: Error
