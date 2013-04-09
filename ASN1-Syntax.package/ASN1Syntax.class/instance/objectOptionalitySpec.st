X.681 grammar
objectOptionalitySpec
	"Spec:
		ObjectOptionalitySpec ::= OPTIONAL | DEFAULT Object"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim , object)