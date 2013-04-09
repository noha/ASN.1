tests
testDefinedSyntax
	self parse: '{
ARGUMENT  Matrix 
RESULT       Matrix 
ERRORS       {determinantIsZero} 
CODE          7 }' rule: #definedSyntax