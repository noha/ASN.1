tests
testEncodeOctetString
	| data |
	self assert: (self codec encodeOctetString: 'DEADBEEF') = #[222 173 190 239].
	"encode odd numbers of hex digits correctly. "
	data := self codec encodeOctetString: 'DEA'.
	self assert: data = #[222 160].
	"right most 4 bits need to be zero"
	self assert: (data last bitAnd: 15) = 0.
	
	self assert: (self codec encodeOctetString: '0') = #[0]
	