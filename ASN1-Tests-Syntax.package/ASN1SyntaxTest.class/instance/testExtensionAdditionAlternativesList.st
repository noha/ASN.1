tests
testExtensionAdditionAlternativesList
	self parse: 'name Name, foo Bar' rule: #extensionAdditionAlternativesList.
	self parse: '[[ name Name, foo Bar]]' rule: #extensionAdditionAlternativesList.
	self parse: '[[ 456: name Name, foo Bar ]], [[ 456: name Name, foo Bar ]]' rule: #extensionAdditionAlternativesList.
