X.680 grammar
enumerations
	"Spec:
		Enumerations ::= 
			RootEnumeration |
			RootEnumeration ',' '...' ExceptionSpec |
			RootEnumeration ',' '...' ExceptionSpec ',' AdditionalEnumeration"
	"Spec: AdditionalEnumeration ::= Enumeration"
	"Spec: RootEnumeration ::= Enumeration"
	^ enumeration,
		($, asParser trim, 
			'...' asParser trim, 
			"exceptionSpec, "
			(($, asParser trim,  enumeration) optional  ==> [ :n | n ifNotNil: [ n second ]])
			) optional
		