tests
testComponentTypeLists
	| parsed |
	parsed := self parse: 'one Two, three Four' rule: #componentTypeLists.
	self assert: (parsed size = 2).
	self assert: (parsed first name = 'one')
