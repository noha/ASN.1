tests
testTypeConstraints
	self parse: 'foobar OPTIONAL, bogus PRESENT' rule: #typeConstraints.
	self parse: 'foobar (1..2) ABSENT, vague (SIZE(16)) OPTIONAL' rule: #typeConstraints.
