X.680 grammar
valueSetTypeAssignment
	"Spec:
		ValueSetTypeAssignment ::= 
			typereference Type '::=' ValueSet"
	^ typeReferenceToken, type, '::=' asParser trim, valueSet  
		==> [:nodes|  Array with: nodes first with: nodes second with: nodes fourth ]