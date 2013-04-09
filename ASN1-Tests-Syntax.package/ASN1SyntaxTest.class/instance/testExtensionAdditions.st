tests
testExtensionAdditions
	self parse: ', name Name' rule: #extensionAdditions.
	self parse: ', [[ name Name, foo Bar]]' rule: #extensionAdditions.
	self parse: ',[[ 456: name Name, foo Bar ]]' rule: #extensionAdditions.
	self parse: '' rule: #extensionAdditions.
