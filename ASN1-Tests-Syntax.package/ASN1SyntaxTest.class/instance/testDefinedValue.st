tests
testDefinedValue
	self parse: 'Abc.def' rule: #definedValue.
	self parse: 'def' rule: #definedValue.
	self parse: 'Abc-def.hig-plo2' rule: #definedValue.
	self fail: 'Abc' rule: #definedValue.
	self fail: '' rule: #definedValue
