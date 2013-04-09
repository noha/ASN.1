tests
testRealValue
	self parse: 'PLUS-INFINITY' rule: #realValue.
	self parse: 'NOT-A-NUMBER' rule: #realValue.
	self parse: '-13' rule: #realValue.
