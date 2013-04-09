tests
testBitStringValue
	self parse: '''010101''B' rule: #bitStringValue.
	self parse: '''DEADBEEF''H' rule: #bitStringValue.
	self parse: '{ foo }' rule: #bitStringValue.
	self parse: '{ foo , bar }' rule: #bitStringValue.
	self parse: 'CONTAINING foo' rule: #bitStringValue.
	