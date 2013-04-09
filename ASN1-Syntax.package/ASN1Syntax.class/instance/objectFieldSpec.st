X.681 grammar
objectFieldSpec
	"Spec:
		ObjectFieldSpec ::= objectfieldreference DefinedObjectClass ObjectOptionalitySpec?"
 	^ objectFieldReference trim, definedObjectClass, objectOptionalitySpec optional