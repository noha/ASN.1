X.683 grammar
parameterizedTypeAssignment
	"Spec:
		ParameterizedTypeAssignment ::= 
			typereference ParameterList '::=' Type"
	^ typeReferenceToken, parameterList , '::=' asParser trim, type