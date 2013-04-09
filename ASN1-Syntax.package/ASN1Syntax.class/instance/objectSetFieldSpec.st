X.681 grammar
objectSetFieldSpec
	"Spec:
		ObjectSetFieldSpec ::= objectsetfieldreference DefinedObjectClass ObjectSetOptionalitySpec ?"
	^ (objectSetFieldReference, definedObjectClass, objectSetOptionality optional) 