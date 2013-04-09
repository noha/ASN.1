tests
testLiteral
	self parse: 'A' rule: #literal.
	self parse: 'ABC' rule: #literal.
	self parse: 'ABC-DEF' rule: #literal.
	self parse: 'AB-CD-EF' rule: #literal.
	self parse: ',' rule: #literal.
	self fail: '-ABC' rule: #literal.
	self fail: 'ABC-' rule: #literal.
	self fail: 'ABC-d' rule: #literal.
