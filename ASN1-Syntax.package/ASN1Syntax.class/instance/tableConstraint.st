X.682 grammar
tableConstraint
	"Spec:
		TableConstraint ::= SimpleTableConstraint | ComponentRelationConstraint
		SimpleTableConstraint ::= ObjectSet"
	^ componentRelationConstraint / objectSet 