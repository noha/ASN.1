tests
testDefinitiveNameAndNumberForm
	| parsed |
	parsed := self parse: 'modules(2)' rule: #definitiveNameAndNumberForm.
	self assert: (parsed name = 'modules').
	self assert: (parsed number = 2).
	