X.683 grammar
parameterList
	"Spec:
		ParameterList ::= '{' Parameter ',' + '}' "
	^ ${ asParser asn1Token, 
		(parameter separatedBy:  $, asParser trim) withoutSeparators , 
		$} asParser asn1Token ==> #second