X.683 grammar
paramGovernor
	"Spec:
		ParamGovernor ::= Governor | DummyGovernor"
	"Spec:
		DummyGovernor ::= DummyReference"
	"Spec:
		DummyReference ::= Reference"
	^ governor / reference