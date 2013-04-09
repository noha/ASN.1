X.680 grammar
booleanValue
	"Spec:
		BooleanValue::= TRUE|FALSE"
	^ ('TRUE' asParser / 'FALSE' asParser) trim