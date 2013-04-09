tests
testCharsDefn
	self parse: '"hello world"' rule: #charsDefn.
	self parse: '"hello""world"' rule: #charsDefn.
	self parse: '"hello""world""world"' rule: #charsDefn.
	self parse: '{8,9}' rule: #charsDefn.
	self parse: '{1,2,3,4}' rule: #charsDefn.
	self parse: 'abc' rule: #charsDefn.
	self parse: 'Foo.abc' rule: #charsDefn.
