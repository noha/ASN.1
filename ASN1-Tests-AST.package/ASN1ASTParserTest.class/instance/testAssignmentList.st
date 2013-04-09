tests
testAssignmentList
	| parsed |
	parsed := self parse: 'foo Bar ::= 1
	zonk Puff ::= 2' rule: #assignmentList.
	self assert: (parsed size = 2).
	self assert: (parsed first right value = 1)