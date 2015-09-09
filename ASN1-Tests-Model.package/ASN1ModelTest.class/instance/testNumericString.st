as yet unclassified
testNumericString
	self assert: (ASN1NumericStringType decode: #[48 48 48 48]) equals: '0000'.
	self assert: (ASN1NumericStringType encode: '0000') equals: #[48 48 48 48].