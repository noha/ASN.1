tests
testEncodingPrefixedType
	self parse: '[ABC:foobar] FooBar' rule: #encodingPrefixedType.
