X.680 grammar
namedValueList
	"spec:
		NamedValueList ::=
   			NamedValue |
   			NamedValueList ',' NamedValue"
	^ (namedValue separatedBy:  $, asParser trim) withoutSeparators 