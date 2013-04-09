X.682 grammar
generalConstraint
	"Spec:
		GeneralConstraint ::= UserDefinedConstraint | TableConstraint | ContentsConstraint"
	^ userDefinedConstraint / tableConstraint / contentsConstraint