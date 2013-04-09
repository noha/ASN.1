X.681 grammar
externalObjectSetReference
	"Spec:
		ExternalObjectSetReference ::= modulereference '.' objectsetreference"
	^ moduleReference, $. asParser, objectSetReference 