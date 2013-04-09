tests
testReference
	self parse: 'Foobar' rule: #reference.
	self parse: 'foobar' rule: #reference.
	self parse: 'FOOBAR' rule: #reference.
