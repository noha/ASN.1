tests
testSyntaxList
	self parse: '{ ABC }' rule: #syntaxList.
	self parse: '{
  [PARAMETER &ParameterType
   [OPTIONAL &parameterTypeOptional]]
  [PRIORITY &ErrorPriority]
  [CODE &errorCode]
}' rule: #syntaxList.
