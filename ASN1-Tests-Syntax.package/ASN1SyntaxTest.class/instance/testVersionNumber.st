tests
testVersionNumber
	self parse: '' rule: #versionNumber.
	self parse: '1:' rule: #versionNumber.
	self fail: '1: ' rule: #versionNumber
