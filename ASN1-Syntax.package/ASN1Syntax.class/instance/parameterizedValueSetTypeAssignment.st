X.683 grammar
parameterizedValueSetTypeAssignment
	"Spec:
		ParameterizedValueSetTypeAssignment ::= typereference ParameterList Type '::=' ValueSet"
	^ typeReferenceToken, parameterList trim, type, '::=' asParser trim, valueSet 