tests
testLowerEndPoint
	self parse: '2' rule: #lowerEndPoint.
	self parse: 'foobar' rule: #lowerEndPoint.
	self parse: 'MIN' rule: #lowerEndPoint.
	self parse: '2<' rule: #lowerEndPoint