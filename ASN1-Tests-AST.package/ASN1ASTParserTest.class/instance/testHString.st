tests
testHString
	| parsed |
	parsed := self parse: '''DEADBEEF''H' rule: #hString.
	self assert: parsed type class = ASN1BitStringTypeNode .
	self assert: parsed value = 'DEADBEEF'