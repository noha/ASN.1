tests
testEncodeOctetString

	self assert: (self codec encodeOctetString: 'deadbeef') = #[100 101 97 100 98 101 101 102].	
	self assert: (self codec encodeOctetString: Character null asString) = #[0]
	