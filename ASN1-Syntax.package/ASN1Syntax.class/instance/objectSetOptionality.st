X.681 grammar
objectSetOptionality
	"Spec:
		ObjectSetOptionalitySpec ::= OPTIONAL | DEFAULT ObjectSet"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, objectSet)