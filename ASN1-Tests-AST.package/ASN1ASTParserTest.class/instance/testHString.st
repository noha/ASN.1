tests
testHString
	| parsed |
	parsed := self parse: '''DEADBEEF''H' rule: #hString.
	self assert: parsed type name = 'hstring'.
	self assert: parsed value = 'DEADBEEF'