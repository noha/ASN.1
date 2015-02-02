tests
testObjectIdWithTwoNodes
	| parsed |
	parsed := self parse: 'id-at-name OBJECT IDENTIFIER ::= { id-at 41 }' rule: #assignmentList.
	self assert: parsed first right alternatives first components size = 2