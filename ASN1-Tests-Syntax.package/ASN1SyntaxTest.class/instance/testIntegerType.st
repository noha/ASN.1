tests
testIntegerType
	self parse: 'INTEGER { a(2) }' rule: #integerType.
	self parse: 'INTEGER{   b(3),  h(a)     }' rule: #integerType.
	self parse: 'INTEGER ' rule: #integerType.
	self fail: '' rule: #integerType.
