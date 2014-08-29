tests
testEncodeOctetString

	self assert: (ASN1OctetString encode: 'deadbeef') = #[100 101 97 100 98 101 101 102].	
	self assert: (ASN1OctetString encode: Character null asString) = #[0]
	