X.680 grammar
namedNumberList
	"spec:
		NamedNumberList ::=
  			 NamedNumber |
   			NamedNumberList ',' NamedNumber"
	^ (namedNumber separatedBy:  $, asParser trim) withoutSeparators 