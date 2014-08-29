tests
testDecodeOctetString
	| data |
	data := #[222 173 190 239].
	
	self assert: (ASN1OctetString decode: data) asByteArray hex = 'deadbeef'.
	"while ignoring bits zero should work"
	self assert: (ASN1OctetString decode: #[0]) = #[ 0 ]
	