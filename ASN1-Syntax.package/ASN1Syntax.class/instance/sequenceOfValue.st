X.680 grammar
sequenceOfValue
	"Spec:
		SequenceOfValue ::= 
			'{' ValueList '}' |
			'{' NamedValueList '}' |
			'{' '}'"
	^ ${ asParser trim, 
		( valueList / namedValueList ) optional,
		$} asParser trim ==> #second