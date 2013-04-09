tests
testExternalTypeReference
	| parsed |
	parsed := self parse: 'Foo.Bar' rule: #externalTypeReference.
	self assert: parsed size = 3.
	self assert: (parsed at: 3) label = 'Bar'.
	self assert: (parsed at: 3) isAsn1ReferenceNode 
	