tests
testIdentifierList
	| parsed |
	parsed := self parse: 'foo, bar, zork' rule: #identifierList.
	self assert: parsed size = 3.
	self assert: parsed = #( 'foo' 'bar' 'zork' )