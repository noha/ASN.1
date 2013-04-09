X.680 grammar
upperEndPoint
	"Spec:
		UpperEndpoint ::= UpperEndValue | '<' UpperEndValue"
	"Spec:
		UpperEndValue ::= Value | MAX"
	^ $< asParser trim optional,  (value / 'MAX' asParser trim)