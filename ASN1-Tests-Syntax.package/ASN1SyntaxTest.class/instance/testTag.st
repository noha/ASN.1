tests
testTag
	self parse: '[ TAG:APPLICATION 0]' rule: #tag.
	self parse: '[APPLICATION 1]' rule: #tag.
	self parse: '[1]' rule: #tag.

	self fail: '' rule: #tag.
	self fail: '[]' rule: #tag.
	self fail: '[HALLO 8]' rule: #tag.
