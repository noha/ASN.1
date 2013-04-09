tests
testUserDefinedConstraintParameter
	self parse: 'Foobar:foobar' rule: #userDefinedConstraintParameter.
	self parse: 'Foobar' rule: #userDefinedConstraintParameter.