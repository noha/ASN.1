tests
testTagClass
	self parse: '' rule: #tagClass.
	self parse: 'UNIVERSAL' rule: #tagClass.
	self parse: 'APPLICATION' rule: #tagClass.
	self parse: 'PRIVATE' rule: #tagClass.
	self fail: 'Abc' rule: #tagClass.
