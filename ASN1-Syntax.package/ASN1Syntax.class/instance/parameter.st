X.683 grammar
parameter
	"Spec:
		Parameter ::= ParamGovernor ':' DummyReference | DummyReference"
	"Spec:
		DummyReference ::= Reference"
	^ (paramGovernor, $: asParser) optional, reference 