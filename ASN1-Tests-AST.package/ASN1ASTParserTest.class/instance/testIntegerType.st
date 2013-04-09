tests
testIntegerType
	| parsed |
	parsed := self parse: 'INTEGER { one(1), two(2) }' rule: #integerType.
	self assert: parsed name = 'INTEGER'.
	self assert: parsed namedNumbers size = 2