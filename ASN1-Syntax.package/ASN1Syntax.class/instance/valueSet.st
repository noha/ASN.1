X.680 grammar
valueSet
	"Spec:
		ValueSet ::= '{' ElementSetSpecs '}' "
	^ ${ asParser asn1Token, elementSetSpecs, $} asParser asn1Token ==> #second
	