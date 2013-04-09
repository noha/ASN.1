tests
testIdentifierList
	self parse: 'a' rule: #identifierList.
	self parse: 'abc' rule: #identifierList.
	self parse: 'aBc,def' rule: #identifierList.
	self parse: 'abc,def34,def' rule: #identifierList.
	self fail: 'abc,Def34,def' rule: #identifierList.
	
	self assert: (self parse: 'abc,def,ghj'  rule: #identifierList) = #( 'abc' 'def' 'ghj' )