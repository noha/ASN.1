tests
testDecodeOctetString
	| data decoded |
	data := #[222 173 190 239].
	
	self assert: (self codec decodeOctetString: data) = 'DEADBEEF'.
	"encode odd numbers of hex digits correctly. "
	self assert: (self codec decodeOctetString: #[222 160]) = 'DEA'.
	"while ignoring bits zero should work"
	self assert: (self codec decodeOctetString: #[0]) = '0'
	