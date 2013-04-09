X.680 grammar
bitStringType
	"Spec:
		BitStringType ::=
			BIT STRING |
			BIT STRING '{' NamedBitList '}'"
	^ ('BIT STRING' asParser trim,
		(${ asParser trim, 
			namedBitList,
			$} asParser trim) optional) 