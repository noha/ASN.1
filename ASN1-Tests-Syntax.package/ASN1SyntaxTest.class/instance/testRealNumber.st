tests
testRealNumber
	self parse: '1.456789e-10' rule: #realNumber.
	self parse: '1.E-10' rule: #realNumber