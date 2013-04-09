X.680 grammar
setValue
	"spec: 
		SetValue ::=
  			 '{' ComponentValueList '}' |
   			'{' '}'"
	^ ${ asParser,
		componentValueList optional, 
		$} asParser ==> #second