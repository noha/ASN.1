tests
testEnumerations
	self parse: 'foo,bar(2),hello' rule: #enumerations.
	self parse: 'foo,bar(2),hello, ...' rule: #enumerations.
	self flag: #needsRedesign.
	"need to check why the implementation of enumerations had exclusions in them"
	"self parse: 'foo,bar(2),hello, ... !Foo:bar' rule: #enumerations.
	self parse: 'foo,bar(2),hello, ... !Foo:bar, one, two , three(3)' rule: #enumerations."
