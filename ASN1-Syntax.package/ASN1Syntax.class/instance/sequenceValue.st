X.680 grammar
sequenceValue
	"Spec: 
		SequenceValue ::= 
			'{' ComponentValueList '}' |	
			'{' '}'"
	^ (${ asParser trim, 
		componentValueList optional , 
		$} asParser trim) ==> #second