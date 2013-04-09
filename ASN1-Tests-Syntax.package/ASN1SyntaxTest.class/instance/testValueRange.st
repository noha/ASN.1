tests
testValueRange
	self parse: '10..20' rule: #valueRange.
	self parse: '10< .. < 200' rule: #valueRange.