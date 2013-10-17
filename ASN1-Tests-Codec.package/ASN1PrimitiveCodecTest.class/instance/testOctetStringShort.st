tests
testOctetStringShort
	| data |
	self assert: (self codec encodeOctetString: '01') = #[1].

	data := self codec encodeOctetString: '01'.
	self assert: (data last bitAnd: 240) = 0.
	
	self assert: (self codec decodeOctetString: #[1]) = '1'
	