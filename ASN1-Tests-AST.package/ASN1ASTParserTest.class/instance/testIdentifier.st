tests
testIdentifier
	| parsed |
	parsed := self parse: 'foo' rule: #identifier.
	self assert: parsed = 'foo'