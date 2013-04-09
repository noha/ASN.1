tests
testRestrictedCharacterStringValue
	self parse: '"hello world"' rule: #restrictedCharacterStringValue.
	self parse: '{ "hello world",{8,9}, abc, Foo.abc }' rule: #restrictedCharacterStringValue.
	self parse: '{8,9,10,11}' rule: #restrictedCharacterStringValue.
	self parse: '{8,9}' rule: #restrictedCharacterStringValue.
