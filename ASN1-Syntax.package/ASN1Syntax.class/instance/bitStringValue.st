X.680 grammar
bitStringValue
	"Spec:
		BitStringValue ::= 
			bstring |	
			hstring |	
			'{' IdentifierList '}'  |	
			'{' '}' |
			CONTAINING Value"
	^ bString / 
		 hString / 
		(( ${ asParser asn1Token, identifierList optional, $} asParser asn1Token) ==> #second) /
		('CONTAINING' asParser trim, value)