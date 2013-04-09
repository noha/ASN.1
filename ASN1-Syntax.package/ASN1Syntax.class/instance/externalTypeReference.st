X.680 grammar
externalTypeReference 
	"spec:
		ExternalTypeReference ::= 
			modulereference
			'.' 
			typereference"
	^ moduleReference , $. asParser, typeReference