X.680 grammar
enumeratedType
	"Spec:
		EnumeratedType ::= ENUMERATED '{' Enumerations '}' "
	^ 'ENUMERATED' asParser asn1Token, ${ asParser asn1Token, enumerations, $} asParser asn1Token
		==> #third