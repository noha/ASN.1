tests
testFieldName
	self parse: '&ArgumentType' rule: #fieldName.
	self parse: '&Errors.&Parameter' rule: #fieldName.
	self parse: '&Errors.&errorCode' rule: #fieldName.
	self parse: '&Linked.&ArgumentType' rule: #fieldName.
	self parse: '&Linked.&Linked.&operationCode' rule: #fieldName.
	self parse: '&Linked.&Linked.&Linked.&Linked.&Linked.&Errors.&errorCode' rule: #fieldName.
 