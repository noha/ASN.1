X.680 grammar
relativeOidValue
	"Spec:
		RelativeOIDValue ::= '{' RelativeOIDComponentsList '}'"
	"Spec:
		RelativeOIDComponentsList ::= 
			RelativeOIDComponents |
			RelativeOIDComponents RelativeOIDComponentsList"
	^ (${ asParser trim, 
		relativeOidComponents plus, 
		$} asParser trim) ==> #second