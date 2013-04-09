X.681 grammar
objectAssignment
	"Spec:
		ObjectAssignment ::= objectreference DefinedObjectClass '::=' Object"
	^ objectReference, definedObjectClass, 
		'::=' asParser trim, object 