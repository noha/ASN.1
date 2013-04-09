tests
testTypeReference
	self parse: 'A' rule: #typeReference.
	self parse: 'Abc' rule: #typeReference.
	self parse: 'Abc-def' rule: #typeReference.
	self parse: 'Abc-Def34' rule: #typeReference.
	self parse: 'B-a' rule: #typeReference.
	self parse: 'CODE' rule: #typeReference.
	self fail: '' rule: #typeReference.
	self fail: 'abc' rule: #typeReference.
	self fail: 'Abc-def-' rule: #typeReference.
	self fail: 'Abc--def' rule: #typeReference
