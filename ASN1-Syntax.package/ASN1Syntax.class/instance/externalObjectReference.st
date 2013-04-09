X.681 grammar
externalObjectReference
	"Spec:
		ExternalObjectReference ::= 
			modulereference '.' objectreference"
	^ moduleReference, $. asParser, objectReference