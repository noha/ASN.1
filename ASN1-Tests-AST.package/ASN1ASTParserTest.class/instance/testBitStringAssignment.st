tests
testBitStringAssignment
	| parsed |
	parsed := self parse: 'alertingLevel-0   AlertingPattern ::= ''00000000''B' rule: #assignmentList.
	self assert: (parsed first right type name = 'BIT STRING')