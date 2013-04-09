X.681 grammar
objectClass
	"Spec:
		ObjectClass ::= DefinedObjectClass | ObjectClassDefn | ParameterizedObjectClass"
	^ objectClassDefn / definedObjectClass / parameterizedObjectClass