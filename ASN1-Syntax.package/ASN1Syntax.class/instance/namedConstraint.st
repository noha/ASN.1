X.680 grammar
namedConstraint
	"Spec:
		NamedConstraint ::= identifier ComponentConstraint"
		"Spec:
		ComponentConstraint ::= ValueConstraint PresenceConstraint"
	"Spec:
		ValueConstraint ::= Constraint | empty"
	^ identifier, (constraint optional, presenceConstraint)