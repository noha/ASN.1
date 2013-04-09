X.680 grammar
tagDefault
	"Spec:
		TagDefault ::=
			EXPLICIT TAGS  |
			IMPLICIT TAGS  |
			AUTOMATIC TAGS |
			empty"
	^ ('EXPLICIT TAGS' asParser / 'IMPLICIT TAGS' asParser / 'AUTOMATIC TAGS' asParser ) trim optional