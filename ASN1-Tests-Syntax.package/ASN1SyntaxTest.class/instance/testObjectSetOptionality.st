tests
testObjectSetOptionality
	self parse: 'OPTIONAL' rule: #objectSetOptionality.
	self parse: 'DEFAULT { a | b | c }' rule: #objectSetOptionality.
