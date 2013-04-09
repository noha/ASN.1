tests
testValueSetTypeAssignment
	self parse: 'Foobar Foobar ::= { foobar }' rule: #valueSetTypeAssignment.
	self parse: 'MAPOperations-Invokable OPERATION ::= 
		{sendRoutingInfoForSM | mo-ForwardSM | mt-ForwardSM}' rule: #valueSetTypeAssignment.