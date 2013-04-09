X.680 grammar
patternConstraint
	"Spec:
		PatternConstraint ::= PATTERN Value"
	^ 'PATTERN' asParser trim, value