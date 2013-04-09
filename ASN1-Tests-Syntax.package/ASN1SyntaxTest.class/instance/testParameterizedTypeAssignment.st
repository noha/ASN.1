tests
testParameterizedTypeAssignment
	self parse: 'ComponentPortion{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  bla BLUBB
}' rule: #parameterizedTypeAssignment.
	self parse: 'ComponentPortion{OPERATION:Invokable, OPERATION:Returnable} ::=
  [APPLICATION 12] 
    SEQUENCE SIZE (1..MAX) OF Component{{Invokable}, {Returnable}}' rule: #parameterizedTypeAssignment.
self parse: 'ComponentPortion{OPERATION:Invokable, OPERATION:Returnable} ::=
  [APPLICATION 12] 
    SEQUENCE SIZE (1..MAX) OF Component{{Invokable}, {Returnable}}' rule: #parameterizedAssignment