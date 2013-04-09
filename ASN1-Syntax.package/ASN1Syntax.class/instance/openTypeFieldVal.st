X.681 grammar
openTypeFieldVal
	"Spec:
		OpenTypeFieldVal ::= Type ':' Value"
	^ type, $: asParser, value