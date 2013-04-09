X.680 grammar
typeWithConstraint
	"Spec:
		TypeWithConstraint ::= 
			SET Constraint OF Type |
			SET SizeConstraint OF Type |
			SEQUENCE Constraint OF Type |
			SEQUENCE SizeConstraint OF Type |
			SET Constraint OF NamedType |
			SET SizeConstraint OF NamedType |
			SEQUENCE Constraint OF NamedType |
			SEQUENCE SizeConstraint OF NamedType"
	"Spec:
		SizeConstraint ::= SIZE Constraint"
	^ ('SET' asParser /'SEQUENCE' asParser) trim, 
		('SIZE' asParser optional, constraint ), 
		'OF' asParser trim, 
		(namedType / type)