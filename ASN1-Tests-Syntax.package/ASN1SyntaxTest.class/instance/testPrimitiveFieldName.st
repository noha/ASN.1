tests
testPrimitiveFieldName
	self parse: '&fooBar' rule: #primitiveFieldName.
	self parse: '&FooBar' rule: #primitiveFieldName.

