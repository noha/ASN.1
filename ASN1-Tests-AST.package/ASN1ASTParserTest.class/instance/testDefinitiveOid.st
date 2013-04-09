tests
testDefinitiveOid
	| parsed |
	parsed := self parse: '{itu-t recommendation q 775 modules(2) examples(2) version1(1)}' rule: #definitiveOid.
	self assert: parsed components size =7.
	self assert: (parsed components at: 6) number = 2
	