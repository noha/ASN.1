tests
testBooleanValue
	self parse: 'TRUE' ruleSelector: #booleanValue.
	self parse: 'FALSE' ruleSelector: #booleanValue.
	self parse: ' TRUE' ruleSelector: #booleanValue.
	self parse: 'FALSE ' ruleSelector: #booleanValue.
