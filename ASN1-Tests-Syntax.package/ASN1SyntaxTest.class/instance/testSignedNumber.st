tests
testSignedNumber
	self parse: '1' rule: #signedNumber.
	self parse: '1362763728' rule: #signedNumber.
	self parse: '-136' rule: #signedNumber.
	self fail: '- 136' rule: #signedNumber.
	self fail: ' -136' rule: #signedNumber.
	self fail: '' rule: #signedNumber
