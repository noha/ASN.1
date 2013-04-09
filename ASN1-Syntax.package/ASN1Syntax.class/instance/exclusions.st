X.680 grammar
exclusions
	"Spec:
		Exclusions ::= EXCEPT Elements"
	^ 'EXCEPT' asParser trim, elements ==> #second