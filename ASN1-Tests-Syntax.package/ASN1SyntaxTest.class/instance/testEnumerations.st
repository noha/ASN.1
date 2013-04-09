tests
testEnumerations
	self parse: 'foo,bar(2),hello' rule: #enumerations.
	self parse: 'foo,bar(2),hello, ...' rule: #enumerations.
	self parse: 'foo,bar(2),hello, ... !Foo:bar' rule: #enumerations.
	self parse: 'foo,bar(2),hello, ... !Foo:bar, one, two , three(3)' rule: #enumerations.
