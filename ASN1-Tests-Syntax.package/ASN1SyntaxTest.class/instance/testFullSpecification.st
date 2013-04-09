tests
testFullSpecification
	self parse: '{ foobar OPTIONAL, bogus PRESENT }' rule: #fullSpecification.
	self parse: '{ foobar (1..2) ABSENT, vague (SIZE(16)) OPTIONAL }' rule: #fullSpecification.
