X.683 grammar
parameterizedValueAssignment
	"Spec:
		ParameterizedValueAssignment ::= valuereference ParameterList Type '::=' Value"
	^ valueReference trim, parameterList trim, type, '::=' asParser trim, value