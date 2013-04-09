tests
testRelativeOidComponents
	self parse: '1' rule: #relativeOidComponents.
	self parse: 'foo(1)' rule: #relativeOidComponents.
	self parse: 'foo' rule: #relativeOidComponents.
