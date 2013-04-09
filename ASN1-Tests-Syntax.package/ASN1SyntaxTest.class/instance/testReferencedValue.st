tests
testReferencedValue
	self parse: 'foobar' rule: #referencedValue.
	self parse: 'foobar.&foobar' rule: #referencedValue.
	self parse: 'foobar.&Foobar' rule: #referencedValue.
