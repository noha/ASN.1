tests
testValueSetOptionalitySpec
	self parse: 'OPTIONAL' rule: #valueSetOptionalitySpec.
	self parse: 'DEFAULT {foobar}' rule: #valueSetOptionalitySpec.

