tests
testExceptionSpec
	self parse: '! -234' rule: #exceptionSpec.
	self parse: '! Foobar:xyz' rule: #exceptionSpec.
