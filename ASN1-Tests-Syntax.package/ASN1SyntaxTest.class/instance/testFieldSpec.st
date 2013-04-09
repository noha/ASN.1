tests
testFieldSpec
	self parse: '&Errors                ERROR OPTIONAL' rule: #fieldSpec.
	self parse: '&argumentTypeOptional  BOOLEAN OPTIONAL' rule: #fieldSpec.
	self parse: '&ArgumentType          OPTIONAL' rule: #fieldSpec.