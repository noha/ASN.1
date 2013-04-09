X.680 grammar
setOfValue
	"Spec:
		SetOfValue ::= 
			'{' ValueList '}' |
			'{' NamedValueList '}' |
			'{' '}'"
	^ ${ asParser trim, 
		( valueList / namedValueList ) optional,
		$} asParser trim ==> #second