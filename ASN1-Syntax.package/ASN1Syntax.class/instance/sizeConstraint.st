X.682 grammar
sizeConstraint
	"Spec: SizeConstraint ::= SIZE Constraint"
	^ 'SIZE' asParser asn1Token, constraint