tests
testDurationType
	| parsed |
	parsed := self parse: 'DURATION' rule: #durationType.
	self assert: parsed name = 'DURATION'.
	