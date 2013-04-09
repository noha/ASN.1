tests
testExtensionAdditionAlternativesGroup
	self parse: '[[ name Name, foo Bar]]' rule: #extensionAdditionGroup.
	self parse: '[[ 456: name Name, foo Bar ]]' rule: #extensionAdditionGroup.
