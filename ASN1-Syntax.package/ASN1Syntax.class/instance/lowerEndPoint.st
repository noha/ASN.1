X.680 grammar
lowerEndPoint
	"Spec:
		LowerEndpoint ::= LowerEndValue | LowerEndValue '<' "
	"Spec:
		LowerEndValue ::= Value | MIN"
	^ (value / 'MIN' asParser trim), $< asParser trim optional