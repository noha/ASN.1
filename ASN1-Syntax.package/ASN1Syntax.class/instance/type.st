X.680 grammar
type
	"spec:
		Type ::= BuiltinType | ReferencedType | ConstrainedType
		ConstrainedType ::= 
			Type Constraint |
			TypeWithConstraint"
	"Mixed in constrainedTypeDefintion: '(type, constraint) / typeWithContstraint' to avoid left recursion "
	^ (typeWithConstraint / builtinType / anyType / referencedType  ) , (constraint star)