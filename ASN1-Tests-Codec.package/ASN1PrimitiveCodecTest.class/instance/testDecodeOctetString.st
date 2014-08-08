tests
testDecodeOctetString
	| data |
	data := #[222 173 190 239].
	
	self assert: (self codec decodeOctetString: data) asByteArray hex = 'deadbeef'.
	"while ignoring bits zero should work"
	self assert: (self codec decodeOctetString: #[0]) = Character null asString
	