as yet unclassified
testNumericString
	self assert: (ASN1NumericString decode: #[48 48 48 48]) equals: '0000'.
	self assert: (ASN1NumericString encode: '0000') equals: #[48 48 48 48].