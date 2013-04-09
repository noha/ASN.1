X.680 grammar
choiceValue
	"Spec:
		ChoiceValue ::= 
			identifier ':' Value"
	^ identifier , $: asParser trim , value