tests
testDefinedType
	self parse: 'TCMessage{{Supported-MAP-Operations}, {Supported-MAP-Operations}}' rule: #definedType.
	self parse: 'Foo.Bar' rule: #definedType.
	self parse: 'TCMessage' rule: #definedType