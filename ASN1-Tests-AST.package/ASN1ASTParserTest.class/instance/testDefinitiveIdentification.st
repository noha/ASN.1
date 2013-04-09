tests
testDefinitiveIdentification
	| parsed |
	parsed := self parse: '{itu-t recommendation q 775 modules(2) examples(2) version1(1)}' rule: #definitiveIdentification.
	self assert: (parsed components size = 7).
	self assert: (parsed components at: 4) name = '775'
		