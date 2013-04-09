tests
testObjectClassReference
	
	self parse: 'FOOBAR' rule: #objectClassReference.
	self parse: 'FOOBAR-FOO' rule: #objectClassReference.
	self fail: 'FOOBAR-' rule: #objectClassReference.
	self fail: 'FooBAR' rule: #objectClassReference