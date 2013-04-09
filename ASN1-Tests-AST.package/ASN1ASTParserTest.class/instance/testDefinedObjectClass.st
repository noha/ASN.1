tests
testDefinedObjectClass
	| parsed |
	parsed := self parse: 'FOO-BAR' rule: #definedObjectClass.
	self assert: parsed isAsn1ReferenceNode 