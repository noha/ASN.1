tests
testSequenceOfValue
	self parse: '{}' rule: #sequenceOfValue.
	self parse: '{ 1,2,3,4,5,6,7 }' rule: #sequenceOfValue.
	self parse: '{ abc, def ,ghi }' rule: #sequenceOfValue.

