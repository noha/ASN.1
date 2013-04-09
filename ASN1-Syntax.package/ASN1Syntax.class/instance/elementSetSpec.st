X.680 grammar
elementSetSpec
	"Spec:
		ElementSetSpec ::= Unions |	ALL Exclusions"
	^ unions / ('ALL' asParser trim, exclusions)