as yet unclassified
tcapToolsNoComment
	^ 'TCAP-Tools {itu-t recommendation q 775 modules(2) tools(1) version1(1)}
DEFINITIONS ::=
BEGIN

EXPORTS 
        cancel, 
        cancelFailed, 
        cancelled
;

IMPORTS
  OPERATION, ERROR
    FROM Remote-Operations-Information-Objects {joint-iso-itu-t
      remote-operations(4) informationObjects(5) version1(0)}

  TCInvokeIdSet
    FROM TCAPMessages {itu-t recommendation q 773 modules(2) messages(1)
      version3(3)}
;

cancel OPERATION ::= {
  ARGUMENT  present < TCInvokeIdSet
  ERRORS    {cancelFailed}
}

cancelFailed ERROR ::= {
  PARAMETER
    SET {problem   [0]  CancelProblem,
         invokeId  [1]  present < TCInvokeIdSet}
}

CancelProblem ::= ENUMERATED {
  unknownInvocation(0), tooLate(1), notCancellable(2)}

cancelled ERROR ::=
  {}

END
'