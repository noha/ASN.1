X.680 grammar
integerValue
	"Spec:
		IntegerValue ::= 
			SignedNumber |	
			identifier"
	^ signedNumber flatten 
		/ identifier trim