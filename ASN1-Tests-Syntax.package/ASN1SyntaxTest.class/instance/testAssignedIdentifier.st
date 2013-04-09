tests
testAssignedIdentifier
	self parse: '' rule: #assignedIdentifier.
	self parse: 'foobar' rule: #assignedIdentifier.
	self parse: 'foobar{Foo}' rule: #assignedIdentifier.
	self parse: '{ one two(2) three }' rule: #assignedIdentifier.
