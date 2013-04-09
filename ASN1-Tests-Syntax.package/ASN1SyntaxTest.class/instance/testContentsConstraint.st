tests
testContentsConstraint
	self parse: 'CONTAINING Foo' rule: #contentsConstraint.
	self parse: 'ENCODED BY local:1' rule: #contentsConstraint.
	self parse: 'CONTAINING Foo ENCODED BY local:1' rule: #contentsConstraint.
