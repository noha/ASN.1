tests
testFieldSetting
	| parsed |
	parsed := self parse: '&Foo Bar' rule: #fieldSetting.
	self assert: parsed size = 2.
	self assert: (parsed allSatisfy: [:each| each isAsn1ReferenceNode ])	