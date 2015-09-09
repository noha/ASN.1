tests
testEncodeOctetString

	self assert: (ASN1OctetStringType encode: 'deadbeef') = #[100 101 97 100 98 101 101 102].	
	self assert: (ASN1OctetStringType encode: Character null asString) = #[0]
	