tests
testBString
	self parse: '''0010011''B' rule: #bString.
	self parse: '''001 0011''B' rule: #bString.
	self parse: '''001 00
	11''B' rule: #bString.
	self fail: '''001 0011''' rule: #bString.
	self fail: '''001 0011B' rule: #bString.
	self fail: '001 0011''B' rule: #bString.
	self fail: '''0012011''B' rule: #bString.
	self assert: (self parse: '''0010011''B' rule: #bString) size = 7