tests
testNumber
	self parse: '1' rule: #number.
	self parse: '1362763728' rule: #number.
	self fail: '-136' rule: #number.
	self fail: 'abc' rule: #number.
	self fail: ' abc ' rule: #number.
	self fail: '' rule: #number