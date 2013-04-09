tests
testIntegerValue
	self parse: '-15' rule: #integerValue.
	self parse: 'foobar' rule: #integerValue.