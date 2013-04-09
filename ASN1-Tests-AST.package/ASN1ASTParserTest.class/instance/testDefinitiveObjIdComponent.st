tests
testDefinitiveObjIdComponent
	| parsed |
	parsed := self parse: 'itu-t' rule: #definitiveObjIdComponent.
	self assert: (parsed name = 'itu-t').
	self assert: (parsed number = 0)