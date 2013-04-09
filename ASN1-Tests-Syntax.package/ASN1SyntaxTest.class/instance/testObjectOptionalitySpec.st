tests
testObjectOptionalitySpec
	self parse: 'OPTIONAL' rule: #objectOptionalitySpec.
	self parse: 'DEFAULT foobar' rule: #objectOptionalitySpec.

