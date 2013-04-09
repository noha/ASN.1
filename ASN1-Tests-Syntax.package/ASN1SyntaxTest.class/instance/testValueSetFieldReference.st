tests
testValueSetFieldReference
	self parse: '&ArgumentTypeOptional' rule: #valueSetFieldReference.
	self fail: '&errors' rule: #valueSetFieldReference.