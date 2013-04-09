tests
testBooleanType
	| parsed |
	parsed := self parse: 'BOOLEAN' rule: #booleanType.
	self assert: (parsed name = 'BOOLEAN').