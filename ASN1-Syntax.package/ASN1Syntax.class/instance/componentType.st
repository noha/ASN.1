X.680 grammar
componentType
	"spec:
		ComponentType ::=
   			NamedType |
   			NamedType OPTIONAL |
   			NamedType DEFAULT Value |
   			COMPONENTS OF  Type"
	^ (namedType , 
		(('OPTIONAL' asParser trim) / 
		('DEFAULT' asParser trim,  value)) optional)  / 
	  ('COMPONENTS OF' asParser trim, type)