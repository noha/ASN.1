X.680 grammar
valueAssignment
	"Spec:
		ValueAssignment ::= 
			valuereference Type '::=' Value"
	^ valueReferenceToken, type, '::=' asParser trim, value ==> [:nodes|  Array with: nodes first with: nodes second with: nodes fourth ]