tests
testSetting
	self parse: 'Foobar' rule: #setting.
	self parse: 'foobar' rule: #setting.
	self parse: '{ abc }' rule: #setting.
	self parse: '{ abc | def }' rule: #setting.

