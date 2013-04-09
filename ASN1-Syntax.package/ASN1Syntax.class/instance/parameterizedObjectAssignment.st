X.683 grammar
parameterizedObjectAssignment
	"Spec:
		ParameterizedObjectAssignment ::=
			objectreference ParameterList DefinedObjectClass '::=' Object"
	^ objectReference, parameterList trim, definedObjectClass, '::=' asParser trim, object 