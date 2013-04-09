tests
testExtensionAdditionList
	self parse: 'name Name, foo Bar' rule: #extensionAdditionList.
	self parse: '[[ name Name, foo Bar]]' rule: #extensionAdditionList.
	self parse: '[[ 456: name Name, foo Bar ]], [[ 456: name Name, foo Bar ]]' rule: #extensionAdditionList.
