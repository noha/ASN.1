tests
testCharacterStringList
	self parse: '{ "hello world",{8,9}, abc, Foo.abc }' rule: #characterStringList.
