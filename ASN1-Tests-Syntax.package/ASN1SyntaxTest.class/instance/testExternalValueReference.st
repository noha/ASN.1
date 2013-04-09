tests
testExternalValueReference
	self parse: 'Abc.def' rule: #externalValueReference.
	self parse: 'Abc-def.hig-plo2' rule: #externalValueReference.
	self fail: 'abc' rule: #externalValueReference.
	self fail: 'abc.def' rule: #externalValueReference.
	self fail: 'Abc.Def' rule: #externalValueReference.
