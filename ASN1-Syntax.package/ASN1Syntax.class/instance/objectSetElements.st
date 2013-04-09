X.681 grammar
objectSetElements
	"Spec:
		ObjectSetElements ::= 
			Object | 
			DefinedObjectSet | 
			ObjectSetFromObjects | 
			ParameterizedObjectSet"
	^ object / parameterizedObjectSet / definedObjectSet / objectSetFromObjects 