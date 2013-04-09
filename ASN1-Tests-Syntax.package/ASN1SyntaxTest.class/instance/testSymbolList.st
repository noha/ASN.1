tests
testSymbolList
	self parse: 'OPERATION,ERROR' rule: #symbolList.
	self parse: 'ROS{}, InvokeId' rule: #symbolList.
	