tests
testBooleanAssignment
	| parsed |
	parsed := self parse: 'foo TestType ::= TRUE' rule: #assignmentList.
	self assert: (parsed first right type name = 'BOOLEAN')