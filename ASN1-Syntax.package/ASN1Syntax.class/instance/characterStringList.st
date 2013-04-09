X.680 grammar
characterStringList
	"spec:
		CharacterStringList ::= '{' CharSyms '}'"
	^ ${ asParser trim, charSyms, $} asParser trim ==> #second