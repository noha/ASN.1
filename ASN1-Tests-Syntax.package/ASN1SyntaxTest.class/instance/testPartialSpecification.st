tests
testPartialSpecification
	self parse: '{ ..., foobar ABSENT}' rule: #partialSpecification.
	self parse: '{ ..., foobar (SIZE(4)) ABSENT}' rule: #partialSpecification