X.681 grammar
usefulObjectClassReference
	"Spec:
		UsefulObjectClassReference ::=
			TYPE-IDENTIFIER | 
			ABSTRACT-SYNTAX"
	^ ('TYPE-IDENTIFIER' asParser / 'ABSTRACT-SYNTAX' asParser) trim