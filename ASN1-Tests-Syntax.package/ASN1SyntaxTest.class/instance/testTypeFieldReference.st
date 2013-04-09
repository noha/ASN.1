tests
testTypeFieldReference
	self parse: '&Errors' rule: #typeFieldReference.
	self fail: '&argumentTypeOptional' rule: #typeFieldReference.