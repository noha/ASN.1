tests
testPrefixedType
	self parse: '[APPLICATION 2] IMPLICIT Foobar' rule: #prefixedType.
	self parse: '[0] IMPLICIT IsdnNumber' rule: #prefixedType.
