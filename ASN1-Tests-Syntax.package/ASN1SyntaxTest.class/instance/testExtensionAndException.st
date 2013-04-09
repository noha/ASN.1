tests
testExtensionAndException
	self parse: '...' rule: #extensionAndException.
	self parse: '... ! Foo:bar' rule: #extensionAndException.
