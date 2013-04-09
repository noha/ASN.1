tests
testComponentType
	self parse: 'name Name' rule: #componentType.
	self parse: 'name Name' rule: #componentType.
	self parse: 'name Name OPTIONAL' rule: #componentType.
	self parse: 'name Name DEFAULT {}' rule: #componentType.
	self parse: 'COMPONENTS OF Foo' rule: #componentType.