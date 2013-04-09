tests
testObject
	self parse: '{ 
	ARGUMENT 	INTEGER
	ERRORS 	{ { PARAMETER INTEGER CODE 1000 } | { CODE 1001 } }
	CODE 		1 }' rule: #object.
	self parse: '{CODE  local:1}' rule: #object.
