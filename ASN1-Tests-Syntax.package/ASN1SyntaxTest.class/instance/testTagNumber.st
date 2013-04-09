tests
testTagNumber
	self parse: '153' rule: #tagNumber.
	self parse: 'abc' rule: #tagNumber.
	self fail: '' rule: #tagNumber.
