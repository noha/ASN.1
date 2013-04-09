tests
testAtNotation
	self parse: '@identifier' rule: #atNotation.
	self parse: '@.identifier' rule: #atNotation.
	self parse: '@...identifier.bla' rule: #atNotation.
