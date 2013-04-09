tests
testAssignmentList
	self parse: 'TCMessage{OPERATION:Invokable, OPERATION:Returnable} ::= CHOICE {
  unidirectional  [APPLICATION 1]  Unidirectional{{Invokable}, {Returnable}},
  begin           [APPLICATION 2]  Begin{{Invokable}, {Returnable}},
  end             [APPLICATION 4]  End{{Invokable}, {Returnable}},
  continue        [APPLICATION 5]  Continue{{Invokable}, {Returnable}},
  abort           [APPLICATION 7]  Abort
}

Unidirectional{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}}
}

Begin{OPERATION:Invokable, OPERATION:Returnable} ::= SEQUENCE {
  otid             OrigTransactionID,
  dialoguePortion  DialoguePortion OPTIONAL,
  components       ComponentPortion{{Invokable}, {Returnable}} OPTIONAL
}
' rule: #assignmentList.
