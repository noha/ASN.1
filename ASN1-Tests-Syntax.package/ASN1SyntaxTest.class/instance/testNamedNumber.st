tests
testNamedNumber
	self parse: 'abc ( 153 )' rule: #namedNumber.
	self parse: 'abc ( -32 )' rule: #namedNumber.
	self parse: 'abc( foobar)' rule: #namedNumber.
	self fail: '' rule: #namedNumber.
	self fail: 'abc ( 8' rule: #namedNumber.
