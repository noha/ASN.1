tests
testOctetStringValue
	self parse: '''010101''B' rule: #bitStringValue.
	self parse: '''DEADBEEF''H' rule: #bitStringValue.
	self parse: 'CONTAINING foo' rule: #bitStringValue.
	