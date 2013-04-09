tests
testEncodingReferenceDefault
	self parse: 'ABC:INSTRUCTIONS' rule: #encodingReferenceDefault.
	self parse: 'FOO-3BAR:INSTRUCTIONS' rule: #encodingReferenceDefault.
	self parse: '' rule: #encodingReferenceDefault.
