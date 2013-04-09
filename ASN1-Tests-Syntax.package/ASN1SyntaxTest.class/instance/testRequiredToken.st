tests
testRequiredToken
	self parse: 'FOO' rule: #requiredToken.
	self parse: '&Foo' rule: #requiredToken.
	self parse: '&foo' rule: #requiredToken.


