tests
testObjectIdWithReference
	| parsed |
	parsed := self parse: 'map-ac  OBJECT IDENTIFIER ::= {gsm-NetworkId ac-Id}' rule: #assignmentList.
	self assert: parsed first right components size = 2