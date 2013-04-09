tests
testWithSyntaxSpec
	self parse: 'WITH SYNTAX {
  [ARGUMENT &ArgumentType
   [OPTIONAL &argumentTypeOptional]]
  [RESULT &ResultType
   [OPTIONAL &resultTypeOptional]]
  [RETURN RESULT &returnResult]
  [ERRORS &Errors]
  [LINKED &Linked]
  [SYNCHRONOUS &synchronous]
  [ALWAYS RESPONDS &alwaysReturns]
  [INVOKE PRIORITY &InvokePriority]
  [RESULT-PRIORITY &ResultPriority]
  [CODE &operationCode]
}' rule: #withSyntaxSpec