tests
testEncodePrintableString
	self assert: (ASN1PrintableStringType encode: 'hallo') = #[104 97 108 108 111].
	self 
		should: [ ASN1PrintableStringType encode: 'hallo@'  ]
		raise: Error
