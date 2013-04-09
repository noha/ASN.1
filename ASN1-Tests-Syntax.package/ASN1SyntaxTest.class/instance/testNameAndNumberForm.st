tests
testNameAndNumberForm
	
	self assert: (self parse: 'modules(3)' rule: #nameAndNumberForm) = #( 'modules' '3' )