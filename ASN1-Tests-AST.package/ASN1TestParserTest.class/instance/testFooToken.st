tests
testFooToken
	self parse: 'foo' rule: #fooToken.
	self assert: (self parse: 'foo ' rule: #fooToken) value = 'foo'