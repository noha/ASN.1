tests
testValueFieldReference
	self parse: '&argumentTypeOptional' rule: #valueFieldReference.
	self fail: '&Errors' rule: #valueFieldReference.