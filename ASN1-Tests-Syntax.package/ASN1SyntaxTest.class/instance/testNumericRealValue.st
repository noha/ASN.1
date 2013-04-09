tests
testNumericRealValue
	self parse: '1.456789e-10' rule: #numericRealValue.
	self parse: '-1.E-10' rule: #numericRealValue.
	self parse: '{}' rule: #numericRealValue