tests
testDefaultSyntax
	| parsed |
	parsed := self parse: '{
&ArgumentType Matrix,
&ResultType  Matrix, 
&Errors {determinantIsZero},
&operationCode 7
}' rule: #defaultSyntax.
	self assert: (parsed size = 4)