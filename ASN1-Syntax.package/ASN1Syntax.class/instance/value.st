X.680 grammar
value
	"spec:
		Value ::=
   			BuiltinValue |
   			ReferencedValue |
   			ObjectClassFieldValue"
	"Spec: ObjectClassFieldValue ::= OpenTypeFieldVal | FixedTypeFieldVal"
	"Spec: FixedTypeFieldVal ::= BuiltinValue | ReferencedValue"
	"using longest match parser because builtinValue and referencedValue are ambiguous. At least the
	integerValue in builtValue can resolve to identifier preventing extended value formats like
	parameterizedValue to be parsed"
	^   openTypeFieldVal /  builtinValue /> referencedValue