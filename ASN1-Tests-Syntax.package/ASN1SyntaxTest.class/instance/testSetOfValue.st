tests
testSetOfValue
	self parse: '{}' rule: #setOfValue.
	self parse: '{ 1,2,3,4,5,6,7 }' rule: #setOfValue.
	self parse: '{ abc, def ,ghi }' rule: #setOfValue.

