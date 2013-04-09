tests
testCString
	self parse: '"hello world"' rule: #cString.
	self parse: '"hello""world"' rule: #cString.
	self parse: '"hello""world""world"' rule: #cString.
	self parse: '"hello""""world"' rule: #cString.
	self parse: '""""' rule: #cString.
