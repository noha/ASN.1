tests
testOptionalExtensionMarker
	self parse: ',...' rule: #optionalExtensionMarker.
	self parse: ',   ...' rule: #optionalExtensionMarker.
