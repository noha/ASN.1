X.680 grammar
externalValueReference
	"spec:
		ExternalValueReference ::=
   			modulereference
   			'.'
   			valuereference"
	^ moduleReference , $. asParser, valueReference