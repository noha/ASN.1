X.680 grammar
numericRealValue
	"Spec: 
		NumericRealValue ::= 
			realnumber |
			'-' realnumber |	
			SequenceValue"
	^ realNumber /
		($- asParser, realNumber) /
		sequenceValue 