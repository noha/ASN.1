tests
testValue
	self parse: '1' rule: #value.
	self parse: 'foobar' rule: #value.
	self parse: 'Foobar:foobar' rule: #value.

