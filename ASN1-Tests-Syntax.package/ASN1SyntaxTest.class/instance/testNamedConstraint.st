tests
testNamedConstraint
	self parse: 'foobar OPTIONAL' rule: #namedConstraint.
	self parse: 'foobar (1..2) ABSENT' rule: #namedConstraint.
	self parse: 'foobar (SIZE(4)) PRESENT' rule: #namedConstraint.
