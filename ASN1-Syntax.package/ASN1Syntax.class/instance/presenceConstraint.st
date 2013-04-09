X.680 grammar
presenceConstraint
	"Spec:
		PresenceConstraint ::=PRESENT|ABSENT|OPTIONAL|empty"
	^ ( 'PRESENT' asParser / 'ABSENT' asParser / 'OPTIONAL' asParser) trim optional