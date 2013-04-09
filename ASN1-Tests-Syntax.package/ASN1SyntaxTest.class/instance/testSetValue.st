tests
testSetValue
	self parse: '{}' rule: #setValue.
	self parse: '{ foo bar }' rule: #setValue.
	self parse: '{ abc def ,ghi jkl}' rule: #setValue.

