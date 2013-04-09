tests
testType
	self parse: 'Foobar' rule: #type.
	self parse: 'Foobar(Foobar)' rule: #type.
	self parse: 'Foobar(Foobar)' rule: #type.
	