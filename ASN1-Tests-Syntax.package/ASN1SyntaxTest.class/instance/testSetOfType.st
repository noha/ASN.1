tests
testSetOfType
	self parse: 'SET OF Foo' rule: #setOfType.
	self parse: 'SET OF foo Foo' rule: #setOfType.
