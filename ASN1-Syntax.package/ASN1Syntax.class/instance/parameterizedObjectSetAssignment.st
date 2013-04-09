X.683 grammar
parameterizedObjectSetAssignment
	"Spec:
		ParameterizedObjectSetAssignment ::=
			objectsetreference ParameterList DefinedObjectClass '::=' ObjectSet"
	^ objectSetReference, parameterList trim, definedObjectClass, '::=' asParser trim, objectSet 