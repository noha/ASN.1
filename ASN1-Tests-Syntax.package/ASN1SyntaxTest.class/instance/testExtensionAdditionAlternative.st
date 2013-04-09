tests
testExtensionAdditionAlternative
	self parse: 'name Name' rule: #extensionAddition.
	self parse: '[[ name Name, foo Bar]]' rule: #extensionAddition.
	self parse: '[[ 456: name Name, foo Bar ]]' rule: #extensionAddition.
