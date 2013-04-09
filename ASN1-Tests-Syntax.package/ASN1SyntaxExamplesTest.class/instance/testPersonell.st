tests
testPersonell
	self assert: (self parse: self class personnelNotation rule: #assignmentList) isPetitFailure not
	