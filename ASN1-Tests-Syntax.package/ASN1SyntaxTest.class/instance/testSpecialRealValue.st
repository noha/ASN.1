tests
testSpecialRealValue
	self parse: 'PLUS-INFINITY' rule: #specialRealValue.
	self parse: 'NOT-A-NUMBER' rule: #specialRealValue.
