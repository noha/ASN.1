X.680 grammar
enumeration
	"Spec:
		Enumeration ::= 
			EnumerationItem | 
			EnumerationItem ',' Enumeration"
	"Spec:
		EnumerationItem ::=
		 	identifier | 
			NamedNumber"
	^ ((namedNumber / identifier) separatedBy: $, asParser asn1Token) withoutSeparators 