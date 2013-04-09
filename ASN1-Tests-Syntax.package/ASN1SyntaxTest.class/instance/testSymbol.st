tests
testSymbol
	self parse: 'OPERATION' rule: #symbol.
	self parse: 'ROS{}' rule: #symbol.