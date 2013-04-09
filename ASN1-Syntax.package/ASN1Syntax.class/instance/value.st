X.680 grammar
value
	"spec:
		Value ::=
   			BuiltinValue |
   			ReferencedValue |
   			ObjectClassFieldValue"
	"Spec: ObjectClassFieldValue ::= OpenTypeFieldVal | FixedTypeFieldVal"
	"Spec: FixedTypeFieldVal ::= BuiltinValue | ReferencedValue"
	^   openTypeFieldVal / builtinValue  / referencedValue 