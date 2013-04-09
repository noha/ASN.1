tests
testUnions
	self parse: '1 | 2' rule: #unions.
	self parse: '1 UNION 2 .. 83' rule: #unions.
