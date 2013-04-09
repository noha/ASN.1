X.680 grammar
instanceOfType 
	"Spec:
		InstanceOfType ::= INSTANCE OF DefinedObjectClass"
	^ 'INSTANCE OF' asParser trim, definedObjectClass 