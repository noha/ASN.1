tests
testExtensionAdditionAlternatives
	self parse: ',name Name, foo Bar' rule: #extensionAdditionAlternatives.
	self parse: ',[[ name Name, foo Bar]]' rule: #extensionAdditionAlternatives.
	self parse: ',[[ 456: name Name, foo Bar ]], [[ 456: name Name, foo Bar ]]' rule: #extensionAdditionAlternatives.
