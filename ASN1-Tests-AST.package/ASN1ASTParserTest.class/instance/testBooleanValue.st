tests
testBooleanValue
	| parsed |
	parsed := self parse: 'TRUE' rule: #builtinValue.
	self assert: (parsed value = 'TRUE').