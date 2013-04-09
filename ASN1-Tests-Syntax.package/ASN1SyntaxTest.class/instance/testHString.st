tests
testHString
	self parse: '''0010011''H' rule: #hString.
	self parse: '''001 00
	11''H' rule: #hString.
	self parse: '''DEADBEEF''H' rule: #hString.
	self fail: '''DEAD BEEF''' rule: #hString.
	self fail: '''DEADBEEFH' rule: #hString.
	self fail: 'DEADBEEF''H' rule: #hString.
	
	self assert: (self parse: '''DEADBEEF''H' rule: #hString) = 'DEADBEEF'