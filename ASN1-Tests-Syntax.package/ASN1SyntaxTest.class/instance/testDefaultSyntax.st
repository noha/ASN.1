tests
testDefaultSyntax
	self parse: '{
&ArgumentType Matrix,
&ResultType  Matrix, 
&Errors {determinantIsZero},
&operationCode 7
}' rule: #defaultSyntax