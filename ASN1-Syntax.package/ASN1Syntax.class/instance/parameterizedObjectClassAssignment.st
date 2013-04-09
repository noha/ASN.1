X.683 grammar
parameterizedObjectClassAssignment
	"Spec:
		ParameterizedObjectClassAssignment ::= objectclassreference ParameterList '::=' ObjectClass"
	^ objectClassReference, parameterList trim, '::=' asParser trim, objectClass 