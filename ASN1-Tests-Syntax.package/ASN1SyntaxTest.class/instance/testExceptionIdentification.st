tests
testExceptionIdentification
	self parse: '-234' rule: #exceptionIdentification.
	self parse: 'abc' rule: #exceptionIdentification.
	self parse: 'Foo.abc' rule: #exceptionIdentification.
	self parse: 'Foo:abc' rule: #exceptionIdentification.
