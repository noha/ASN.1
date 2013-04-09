X.680 grammar
valueRange
	"Spec:
		ValueRange ::= LowerEndpoint '..' UpperEndpoint"
	^ lowerEndPoint, '..' asParser trim, upperEndPoint ==> [:nodes| nodes copyWithout: nodes second ]