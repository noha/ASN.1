tests
testSequenceOfType
	self parse: 'SEQUENCE OF Foo' rule: #sequenceOfType.
	self parse: 'SEQUENCE OF foo Foo' rule: #sequenceOfType.
