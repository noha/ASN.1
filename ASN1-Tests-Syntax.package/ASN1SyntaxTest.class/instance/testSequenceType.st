tests
testSequenceType
	self parse: 'SEQUENCE {}' rule: #sequenceType.
	self parse: 'SEQUENCE { name Name }' rule: #sequenceType.
	self parse: 'SEQUENCE { ... }' rule: #sequenceType.
	self parse: 'SEQUENCE { ... ! Foo:bar}' rule: #sequenceType.
	self parse: 'SEQUENCE { ... ! Foo:bar, ... }' rule: #sequenceType.
	self parse: 'SEQUENCE {
  calledNumber  IsdnNumber,
  basicService  BasicServiceIndicator OPTIONAL
}' rule: #sequenceType
