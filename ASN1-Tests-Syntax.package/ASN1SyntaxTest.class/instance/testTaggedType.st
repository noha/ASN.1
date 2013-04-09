tests
testTaggedType
	self parse: '[APPLICATION 2] IMPLICIT Foobar' rule: #taggedType.
	self parse: '[0] IMPLICIT IsdnNumber' rule: #taggedType.
