tests
testObjectClassDefn
	self parse: 'CLASS {
  &ArgumentType          OPTIONAL,
  &argumentTypeOptional  BOOLEAN OPTIONAL
}' rule: #objectClassDefn.
