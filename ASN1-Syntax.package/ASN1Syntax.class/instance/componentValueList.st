X.680 grammar
componentValueList
	"spec:
		ComponentValueList ::=
   			NamedValue |
   			ComponentValueList ',' NamedValue"
	^ (namedValue separatedBy: $, asParser trim) withoutSeparators 