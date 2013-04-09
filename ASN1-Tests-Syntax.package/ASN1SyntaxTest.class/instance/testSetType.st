tests
testSetType
	self parse: 'SET {}' rule: #setType.
	self parse: 'SET { name Name }' rule: #setType.
	self parse: 'SET { ... }' rule: #setType.
	self parse: 'SET { ... ! Foo:bar}' rule: #setType.
	self parse: 'SET { ... ! Foo:bar, ... }' rule: #setType.
