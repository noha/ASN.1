tests
testExternalValueReference
	| parsed |
	parsed := self parse: 'Foo.bar' rule: #externalValueReference.
	self assert: parsed size = 3.
	self assert: (parsed at: 3) label = 'bar'.
	self assert: (parsed at: 3) isAsn1ReferenceNode 
	