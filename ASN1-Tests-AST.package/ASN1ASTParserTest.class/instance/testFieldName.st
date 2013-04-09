tests
testFieldName
	| parsed |
	parsed := self parse: '&Foo.&Far.&Zork' rule: #fieldName.
	self assert: parsed size = 3.
	self assert: (parsed allSatisfy: [:each| each isAsn1ReferenceNode ])	