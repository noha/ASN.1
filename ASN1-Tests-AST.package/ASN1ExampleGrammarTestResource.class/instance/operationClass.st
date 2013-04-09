as yet unclassified
operationClass
	<definition: #example>
	^ 'OPERATION ::= CLASS {
  &ArgumentType          OPTIONAL,
  &argumentTypeOptional  BOOLEAN OPTIONAL,
  &returnResult          BOOLEAN DEFAULT TRUE,
  &ResultType            OPTIONAL,
  &resultTypeOptional    BOOLEAN OPTIONAL,
  &Errors                ERROR OPTIONAL,
  &Linked                OPERATION OPTIONAL,
  &synchronous           BOOLEAN DEFAULT FALSE,
  &alwaysReturns         BOOLEAN DEFAULT TRUE,
  &InvokePriority        Priority OPTIONAL,
  &ResultPriority        Priority OPTIONAL,
  &operationCode         Code UNIQUE OPTIONAL
}
WITH SYNTAX {
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
}

ERROR ::= CLASS {
  &ParameterType          OPTIONAL,
  &parameterTypeOptional  BOOLEAN OPTIONAL,
  &ErrorPriority          Priority OPTIONAL,
  &errorCode              Code UNIQUE OPTIONAL
}
WITH SYNTAX {
  [PARAMETER &ParameterType
   [OPTIONAL &parameterTypeOptional]]
  [PRIORITY &ErrorPriority]
  [CODE &errorCode]
}

Code ::= CHOICE {local   INTEGER,
                 global  OBJECT IDENTIFIER
}

Priority ::= INTEGER(0..MAX)
'
