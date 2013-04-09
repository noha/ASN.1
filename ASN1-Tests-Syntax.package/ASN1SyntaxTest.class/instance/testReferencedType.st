tests
testReferencedType
	self parse: 'Foobar' rule: #referencedType.
	self parse: 'foobar<Foobar' rule: #referencedType.
	self parse: 'Foobar.&foobar' rule: #referencedType.
	self parse: 'Foobar.&Foobar' rule: #referencedType.
	self parse: 'FOOBAR' rule: #referencedType.
