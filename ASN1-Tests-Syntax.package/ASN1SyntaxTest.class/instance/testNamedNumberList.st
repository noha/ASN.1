tests
testNamedNumberList
	self parse: 'abc ( 153 ), def(178)' rule: #namedNumberList.
	self parse: 'abc ( -32 )   ,xyz(178178),foobar( hallo     )' rule: #namedNumberList.
	self fail: '' rule: #namedNumberList.
	self fail: 'abc (8) def(9)' rule: #namedNumberList.
	self fail: 'abc (8), def(9),' rule: #namedNumberList.
