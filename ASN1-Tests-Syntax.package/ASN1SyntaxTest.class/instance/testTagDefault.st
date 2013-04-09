tests
testTagDefault
	self parse: 'IMPLICIT TAGS' rule: #tagDefault.
	self parse: 'EXPLICIT TAGS' rule: #tagDefault.
	self parse: 'AUTOMATIC TAGS' rule: #tagDefault.
	self parse: '' rule: #tagDefault.
